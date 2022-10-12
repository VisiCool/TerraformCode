#terraform providers
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}
/*
# can also use for configuration 
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

# using locally store aws credetinals and region
provider "aws" {
  region = "us-east-1"
  profile = "default"
  
}
