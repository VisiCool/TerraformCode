terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}
/*
provider "aws" {
  shared_config_files      = "~/.aws/config"
  shared_credentials_files = "~/.aws/credentials"
  profile                  = "default"
}
provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}*/

provider "aws" {
  region = "us-east-1"
  profile = "default"
  
}
