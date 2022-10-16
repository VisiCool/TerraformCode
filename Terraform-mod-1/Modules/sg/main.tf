#Security group for allow internet to access aws resourse only with https or SSL/TLS with egress

resource "aws_security_group" "allow-https" {
  name        = "allow-https"
  description = "allow-https"
  vpc_id      = aws_vpc.vpc-custom.id

  ingress {
    description = "only for https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "only for http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "allow aws resourse to access internet"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

    tags = var.sg_https_name

}


#Security group for allow internet to access aws resourse only with http or non secure protection with egress


resource "aws_security_group" "allow-http" {
  name        = "allow-http"
  description = "allow-http"
  vpc_id      = aws_vpc.vpc-custom.id

  ingress {
    description = "only for http"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow aws resourse to access internet"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

    tags = var.sg_http_name

}

#Security group for allow device to access aws resourse only with ssh or secure shell with egress


resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "allow-ssh"
  vpc_id      = aws_vpc.vpc-custom.id

  ingress {
    description = "only for ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow aws resourse to access internet"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
  }

    tags = var.sg_ssh_name

}