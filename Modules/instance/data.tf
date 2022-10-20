data "aws_ami" "ec2-ami-ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20220912"]
  }
}



data "aws_ami" "ec2-ami-amazon" {

  most_recent      = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
 

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
    filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}