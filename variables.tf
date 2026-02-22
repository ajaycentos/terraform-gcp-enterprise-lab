variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
}

variable "bucket_names" {
  type        = list(string)
  description = "A list of names for the storage buckets"
}
variable "vpc_name" {
  type        = string
  description = "A list of names for the storage buckets"
}
