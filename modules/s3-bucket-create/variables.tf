variable "bucket" {
  description = "The name of the bucket must be unique globally."
  type        = string
}

variable "bucket_suffix" {
  description = "Creates a unique bucket name ending with the specified suffix."
  type        = string
  
}

variable "acl" {
  description = "ACL to be applied. Default is 'private'."
  type        = string
  default     = "private"
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}

variable "acceleration_status" {
  description = "Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended."
  type        = string
  default     = null
}

variable "website" {
  description = "Map of strings containing static web-site hosting or redirect configuration."
  type        = map(string)
  default     = {}
}

variable "cors_allowed_headers" {
  description = "Specifies which headers are allowed."
  default     = ["Authorization"]
}

variable "cors_allowed_methods" {
  description = "Specifies which methods are allowed. Can be GET, PUT, POST, DELETE or HEAD."
  default     = ["GET"]
}

variable "cors_allowed_origins" {
  description = "Specifies which origins are allowed."
  default     = [""]
}

variable "cors_expose_headers" {
  description = "Specifies expose header in the response."
  default     = []
}

variable "cors_max_age_seconds" {
  description = "Specifies time in seconds that browser can cache the response for a preflight request."
  default     = "3000"
}

variable "is_versioning_enabled" {
  description = "If versioning is set for buckets in case of accidental deletion"
  default     = "false"
}

variable "logging" {
  description = "Map containing access bucket logging configuration."
  type        = map(string)
  default     = {}
}

variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
  default     = []
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}

variable "attach_policy" {
  description = "Controls if S3 bucket should have bucket policy attached."
  type        = bool
  default     = false
}

variable "policy_document" {
  description = "String containing policy that is to be attached to S3."
  type        = string
  default     = ""
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = false
}







