output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = module.s3_bucket_create.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = module.s3_bucket_create.s3_bucket_arn
}

output "s3_bucket_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = module.s3_bucket_create.s3_bucket_bucket_domain_name
}

output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value       = module.s3_bucket_create.s3_bucket_region
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = module.s3_bucket_create.s3_bucket_website_endpoint
}