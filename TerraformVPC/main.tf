resource "aws_vpc" "test_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "test-public-subnet" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = { Name = "dev-public"
  }

}

resource "aws_internet_gateway" "test-igw" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    "Name" = "test-igw"
  }

}

resource "aws_route_table" "test-public-rt" {
  vpc_id = aws_vpc.test_vpc.id
  tags = {
    Name = "test-dev-public-rt"
  }

}

resource "aws_route" "default-route" {
  route_table_id         = aws_route_table.test-public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.test-igw.id
}

resource "aws_route_table_association" "test-public-assos" {
  subnet_id      = aws_subnet.test-public-subnet.id
  route_table_id = aws_route_table.test-public-rt.id

}
resource "aws_security_group" "test-sg" {
  name        = "dev-sg"
  description = "test securty group"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "only for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

    ingress {
    description = "only for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    description = "for internet ips"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "tf-aws-auth" {
  key_name   = "tf-ssh-key"
  public_key = file("~/.ssh/tf-ssh.pub")

}

resource "aws_instance" "test-ec2-tf" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.ec2-ami-ubuntu.id
  key_name               = aws_key_pair.tf-aws-auth.id
  vpc_security_group_ids = [aws_security_group.test-sg.id]
  subnet_id              = aws_subnet.test-public-subnet.id
  user_data              = file("userdata.txt")


  root_block_device {
    volume_size = 10
  }

  tags = {
    "Name" = "test-ec2-tf"
  }




}