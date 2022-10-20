variable "tf_state_store_config" {
    description = "boolean for config or create terraform state lock and store"
}

variable "s3_state_bucket_name" {
    type = string
}

variable "dynamedb_state_db_name" {
    type = string
}