terraform {
    required_version = "= 0.13.0"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "3.36"
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

    bucket                = "zahid-july-main"
    bucket_suffix         = "hourly"
    is_versioning_enabled = "true"

    website = {
    index_document = "index.html"
    error_document = "error.html"
    routing_rules = jsonencode([{
      Condition : {
        KeyPrefixEquals : "docs/"
      },
      Redirect : {
        ReplaceKeyPrefixWith : "documents/"
      }
    }])
    }

    lifecycle_rule = [
    {
      id      = "log"
      enabled = true
      prefix  = "log/"

      tags = {
        rule      = "log"
        autoclean = "true"
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
          }, {
          days          = 60
          storage_class = "GLACIER"
        }
      ]

      expiration = {
        days = 90
      }

      noncurrent_version_expiration = {
        days = 30
      }
    },
    {
      id                                     = "log1"
      enabled                                = true
      prefix                                 = "log1/"
      abort_incomplete_multipart_upload_days = 7

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 60
          storage_class = "ONEZONE_IA"
        },
        {
          days          = 90
          storage_class = "GLACIER"
        },
      ]

      noncurrent_version_expiration = {
        days = 300
      }
    },
  ]

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true


    tags = {
        Terraform = "True"
        Environment = "Dev"
    }
}