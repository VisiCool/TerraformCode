module "vpc" {
    source = "./Modules/vpc"
    vpc_custom_cidr = var.vpc_custom_cidr
  
}

module "subnet" {
    source = "./Modules/subnet"
    vpc_id = module.vpc.vpc_id
    sub_cidr = var.sub
    subnet_id=module.subnet.subnet_id
}

module "sg" {
    source = "./Modules/sg"
    vpc_id = module.vpc.vpc_id
  
}

module "instance" {
    source = "./Modules/instance"
        instance_type=var.instance_type
        key_name = var.key_name
        subnet_id = var.subnet_id
        instace_ami = data.aws_ami.ec2-ami.id
  
} 