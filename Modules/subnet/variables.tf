variable "vpc_id" {
    type = string
}

variable "sub_cidr" {
    type = list
}


variable "sub-name" {
    type = map(any)
    default = {
      Name = "subnet"
    }
}
