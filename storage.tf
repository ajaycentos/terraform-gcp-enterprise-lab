module "cloud_storage" {
# checkov:skip=CKV_TF_1: "Ensure Terraform module sources use a commit hash"  
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 6.0"

  project_id = var.project_id
  names      = var.bucket_names
  location   = "us-east1"
  prefix     = "enterprise"
}

resource "google_storage_bucket_object" "hello_world" {
  name    = "hello.txt"
  content = "Hello from Terraform!"
  bucket  = module.cloud_storage.names["test-bucket-alpha"]
}
