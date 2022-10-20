variable "vpc_id" {
    type=string  
}


variable "custom_sg_name" {
    type = map(any)
    default = {
      Name = "custom_sg_name"
    }
}