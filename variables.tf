variable "aws_access_key" {
  description = "AWS provided access key for AWS account."
  type        = string
  default     = "private"
}

variable "aws_secret_key" {
  description = "AWS provided secret key for AWS account."
  type        = string
  default     = "private"
}

variable "region" {
  description = "AWS region for deployment."
  type        = string
  default     = "private"
}
