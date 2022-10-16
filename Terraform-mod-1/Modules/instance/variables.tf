variable "instance-type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type = string 
}

variable "instance_name" {
  type = map(any)
  default = {
    Name = "instace_test"
  }
  
}

variable "instace_ami" {
  type = string 
}