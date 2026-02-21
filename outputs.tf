output "bucket_urls" {
  description = "The URLs of the created storage buckets"
  value       = module.cloud_storage.urls
}
output "bucket_names" {
  description = "The URLs of the created storage names"
  value       = module.cloud_storage.names
}
output "bucket_alpha" {
  description = "The bucket alpha of the created s"
  value       = module.cloud_storage.names["test-bucket-alpha"]
}
output "bucket_alpha_url" {
  description = "The URLs of bucket alpha"
  value       = module.cloud_storage.urls["test-bucket-alpha"]
}
