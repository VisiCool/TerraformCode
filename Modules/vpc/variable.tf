variable "create_vpc" {
  description = "power option for create vpc"
  default = true
}
variable "config_default_vpc" {
  description = "power option for config default vpc"
  default = false
}

variable "vpc_custom_cidr" {
    type = string
}

variable "namespace" {
  type = string
}

variable "enable_dns_support_default_vpc" {
  description = "dns support for default vpc"
  default = true
}

variable "enable_dns_hostname_default_vpc" {
  description = "dns hostname for default vpc"
  default = true
}

