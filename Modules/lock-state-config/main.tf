#tf state file s3 storage
provider "aws" {
    count = var.tf_state_store_config ? 1: 0
    region = "us-east-"
  
}


resource "aws_s3_bucket" "tf_state_bucket" {
    count = var.tf_state_store_config ? 1: 0
    bucket = var.s3_state_bucket_name
       
    tags = {
        Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
  count = var.tf_state_store_config ? 1: 0
  bucket =aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
    sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "s3_version_enable" {
  count = var.tf_state_store_config ? 1: 0
  bucket=aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status="Enabled"
  }
}


resource "aws_s3_bucket_public_access_block" "s3_bucket_pub_acc" {
  count = var.tf_state_store_config ? 1: 0
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#tf state file dynamodb database

resource "aws_dynamodb_table" "tf_lock_state_db" {
    count = var.tf_state_store_config ? 1: 0
    name           = var.dynamedb_state_db_name
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}