#Security group custom 

resource "aws_security_group" "custom-sg" {
  name        = "custom-sg"
  description = "custom-sg"
  vpc_id      = var.vpc_id
  tags = var.custom_sg_name
}

#Security group for rule igress https or SSL/TLS only
resource "aws_security_group_rule" "rule_sg_ingress_https" {
  type       = "ingress"
  description = "only for https"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.custom-sg.id
}

#Security group for rule igress http or not secure connection
resource "aws_security_group_rule" "rule_sg_ingress_http" {
  type       = "ingress"
  description = "only for http"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.custom-sg.id
}

#Security group for rule igress ssh or secure shell only
resource "aws_security_group_rule" "rule_sg_ingress_ssh" {
  type       = "ingress"
  description = "only for ssh"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.custom-sg.id
}

#Security group for rule egress internet only
resource "aws_security_group_rule" "rule_sg_egress_internet" {
  type       = "egress"
  description = "allow_internet_egress"
  from_port   = 0
  to_port     = 0
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
  security_group_id = aws_security_group.custom-sg.id
}