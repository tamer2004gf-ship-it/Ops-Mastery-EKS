# ننشئ 2 سبنت عامة
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.${count.index + 1}.0/24" # 10.0.1.0 و 10.0.2.0
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "${var.project_name}-public-${count.index}" }
}

# ننشئ 2 سبنت خاصة (وهذا ما يريده الـ EKS)
resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.${count.index + 10}.0/24" # 10.0.10.0 و 10.0.11.0
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = { Name = "${var.project_name}-private-${count.index}" }
}