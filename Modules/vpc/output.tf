output "vpc_id" {
  value = aws_vpc.vpc-custom.id 
}

output "route_table_id" {
  value = aws_vpc.vpc-custom.main_route_table_id
}

output "vpc_default_id" {
  value = aws_default_vpc.vpc_default.id
}