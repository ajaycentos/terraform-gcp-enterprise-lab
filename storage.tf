module "cloud_storage" {
# checkov:skip=CKV_TF_1: "Ensure Terraform module sources use a commit hash"  
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 6.0"

  project_id = var.project_id
  names      = var.bucket_names
  location   = "us-east1"
  prefix     = "enterprise"
}
