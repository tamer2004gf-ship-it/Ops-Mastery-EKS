# =====================================
# AWS Provider Configuration
# =====================================
provider "aws" {
  region = "eu-central-1"
}

# =====================================
# Networking Modules
# =====================================

module "vpc" {
  source       = "./TAMER_Modules/vpc"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
}

module "subnet" {
  source               = "./TAMER_Modules/SubNet"
  vpc_id               = module.vpc.vpc_id
  project_name         = var.project_name
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

module "igw" {
  source       = "./TAMER_Modules/Internet Gatway"
  vpc_id       = module.vpc.vpc_id  
  project_name = var.project_name
}

module "eip" {
  source = "./TAMER_Modules/EIP"
  name   = var.project_name
}

module "nat" {
  source              = "./TAMER_Modules/NAT"
  allocation_id       = module.eip.allocation_id
  public_subnet_ids   = module.subnet.public_subnet_ids 
  internet_gateway_id = module.igw.igw_id
  project_name        = var.project_name
}

module "route_table" {
  source             = "./TAMER_Modules/route_table"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  nat_gateway_id     = module.nat.nat_gateway_id
  public_subnet_ids  = module.subnet.public_subnet_ids
  private_subnet_ids = module.subnet.private_subnet_ids
}

# =====================================
# Storage & State Modules
# =====================================

resource "aws_s3_bucket" "app_assets" {
  bucket = "${var.project_name}-assets-unique-id"
}

module "remote_state" {
  source              = "./TAMER_Modules/remote_state"
  bucket_name         = "${var.project_name}-tf-state-tamer-12345" 
  dynamodb_table_name = "${var.project_name}-tf-locks"
}

# =====================================
# EKS Cluster Module (Updated)
# =====================================

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  # الصلاحيات والوصول
  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true # تفعيل الـ IAM Roles for Service Accounts
  cluster_endpoint_public_access           = true

  # الربط مع موديولات الشبكة
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnet.private_subnet_ids

  eks_managed_node_groups = {
    boutique_nodes = {
      min_size     = 2
      max_size     = 5
      desired_size = 2

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "dev"
    Project     = var.project_name
  }
}

# =====================================
# Terraform Configuration
# =====================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
