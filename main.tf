terraform {
    required_version = "= 0.13.0"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.20.0"
        }
        random = {
            source = "hashicorp/random"
            version = "3.1.0"
        }
    }
}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region     = var.region
}

module "s3_bucket_create" {
    source = "./modules/s3-bucket-create"

    bucket = "zahid-july-main"
    bucket_suffix = "-hourly"

    tags = {
        Terraform = "True"
        Environment = "Dev Testing"
    }
}