variable "bucket_name" {
  description = "The bucket name"
  type        = string
}

variable "location" {
  description = "The bucket location"
  type        = string
  default     = "us-central1"
}

variable "enable_force_destroy" {
  description = "Enable force destroy of gcs bucket"
  type        = bool
  default     = true
}

variable "enable_uniform_bucket_level_access" {
  description = "Enable uniform bucket level access of gcs bucket"
  type        = bool
  default     = true
}
