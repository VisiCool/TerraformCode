#get EC2 instance AMI details which is being used in main.tf file
data "aws_ami" "ec2-ami-ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20220912"]
 }
}
