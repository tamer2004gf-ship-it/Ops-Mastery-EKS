resource "aws_nat_gateway" "main" {
  allocation_id = var.allocation_id
  subnet_id     = var.public_subnet_ids[0] # استخدام أول عنصر من القائمة

  depends_on = [var.internet_gateway_id]
  tags = { Name = "${var.project_name}-nat" }
}