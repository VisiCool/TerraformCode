resource "aws_vpc" "vpc-custom" {
  cidr_block = var.vpc_custom_cidr
  tags =var.vpc_custom-name
}
