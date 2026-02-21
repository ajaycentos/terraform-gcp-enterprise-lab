output "bucket_urls" {
  description = "The URLs of the created storage buckets"
  value       = module.cloud_storage.urls
}
output "bucket_names" {
  description = "The URLs of the created storage names"
  value       = module.cloud_storage.names
}
output "bucket_alpha" {

  description = "The URLs of the created storage names"

  value       = module.cloud_storage.names["test-bucket-alpha"]

}
