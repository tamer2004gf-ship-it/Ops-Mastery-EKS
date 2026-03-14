# الـ Public RT بيبقى كما هو
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = { Name = "${var.project_name}-public-rt" }
}

# الـ Private RT بيبقى كما هو
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
  }
  tags = { Name = "${var.project_name}-private-rt" }
}

# التعديل هنا: ربط كل الـ Public Subnets (2) بالـ Public RT
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = var.public_subnet_ids[count.index] # لاحظ حرف الـ s في ids
  route_table_id = aws_route_table.public.id
}

# التعديل هنا: ربط كل الـ Private Subnets (2) بالـ Private RT
resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = var.private_subnet_ids[count.index] # لاحظ حرف الـ s في ids
  route_table_id = aws_route_table.private.id
}