variable "featurestore_id" {
  description = "The id of featurestore"
  type        = string
}

variable "labels" {
  description = "The labels of featurestore for filter"
  type        = map
}

variable "location" {
  description = "The location of featurestore"
  type        = string
  default     = "us-central1"
}

variable "entitytype_id" {
  description = "The entitytype_id of featurestore"
  type        = string
}

variable "online_serving_fixed_node_count" {
  description = "Number of online serving fixed node count"
  type        = number
  default     = 0
}
