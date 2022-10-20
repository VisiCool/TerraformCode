output "vpc_id" {
  value = aws_vpc.vpc-custom[0].id 
}

output "route_table_id" {
  value = aws_vpc.vpc-custom[0].main_route_table_id
}

output "vpc_default_id" {
  value = aws_default_vpc.vpc_default[0].id
}