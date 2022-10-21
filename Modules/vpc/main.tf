
locals {
  create_vpc=var.create_vpc
}

#vpc new custome
resource "aws_vpc" "vpc-custom" {
  count = local.create_vpc ? 1:0
  cidr_block = var.vpc_custom_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy = "default"
  tags = {
      Name = "${var.namespace}-vpc"
    }
}


#internet gatway new
resource "aws_internet_gateway" "igw-custom" {
  count = local.create_vpc ? 1:0  
  vpc_id = aws_vpc.vpc-custom[0].id
  tags = {
      Name = "${var.namespace}-igw"
    }
}

#route new
resource "aws_route" "route-custom" {
  count = local.create_vpc ? 1:0
  route_table_id         = aws_vpc.vpc-custom[0].main_route_table_id
  destination_cidr_block = "0.0.0.0/0" 
  gateway_id             = aws_internet_gateway.igw-custom[0].id

}

#config default vpc
resource "aws_default_vpc" "vpc_default" {
  count = var.config_default_vpc ? 1:0
  enable_dns_hostnames = var.enable_dns_support_default_vpc
  enable_dns_support = var.enable_dns_hostname_default_vpc
}

