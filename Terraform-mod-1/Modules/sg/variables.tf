variable "vpc_id" {
    tyep=string  
}

variable "sg_https_name" {
    type = map(any)
    default = {
      Name = "allow-internet-https"
    }
}

variable "sg_http_name" {
    type = map(any)
    default = {
      Name = "allow-internet-http"
    }
}

variable "sg_ssh_name" {
    type = map(any)
    default = {
      Name = "allow-ssh"
    }
}

