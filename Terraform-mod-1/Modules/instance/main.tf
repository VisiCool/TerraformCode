resource "aws_instance" "instace_custom" {
  instance_type               = var.instace-web
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  ami = var.instace_ami
  tags = var.instance_name
}
