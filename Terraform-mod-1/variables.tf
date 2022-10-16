variable "vpc_custom_cidr" {
    type = string
    default = ["10.0.0.0/16"]
}

variable "sub_cidr" {
    type = list
    default = ["10.0.0.0/24"]
}