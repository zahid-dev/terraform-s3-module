variable "aws_access_key" {
  description = "AWS provided access key for AWS account."
  type        = string
  default     = "<YOUR_AWS_KEY>"
}

variable "aws_secret_key" {
  description = "AWS provided secret key for AWS account."
  type        = string
  default     = "<YOUR_AWS_SECRET>"
}

variable "region" {
  description = "AWS region for deployment."
  type        = string
  default     = "<YOUR_AWS_DEFAULT_REGION>"
}
