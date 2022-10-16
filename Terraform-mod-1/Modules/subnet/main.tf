resource "aws_subnet" "public-sub" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  
  tags = var.sub-name
}
