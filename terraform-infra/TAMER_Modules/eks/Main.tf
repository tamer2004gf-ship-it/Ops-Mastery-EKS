module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  enable_cluster_creator_admin_permissions = true
  access_entries = {}

  cluster_endpoint_public_access = true

  # الحل هنا: نستخدم var وليس module
  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  eks_managed_node_groups = {
    boutique_nodes = {
      min_size     = 2
      max_size     = 5
      desired_size = 2

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }

  tags = {
    Environment = "dev"
    Project     = var.project_name
  }
}