variable "vpc_custom-name" {
    type = map(any)
    default = {
      Name = "vpc-custom"
    }
}


variable "vpc_custom_cidr" {
    type = string
}