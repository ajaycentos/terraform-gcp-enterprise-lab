
# The Main Assets Bucket
resource "google_storage_bucket" "enterprise_assets" {
  name                        = "${var.project_id}-data-bucket"
  location                    = "US"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

}
