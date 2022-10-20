resource "aws_instance" "instace_custom" {
  instance_type               = var.instance-type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  tags = var.instance_name
}
