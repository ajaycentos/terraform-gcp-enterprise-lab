module "vpc" {
# checkov:skip=CKV_TF_1: "Ensure Terraform module sources use a commit hash"
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "~> 16.0"

    project_id   = var.project_id
    network_name = var.vpc_name

    shared_vpc_host = false
}

module "subnet" {
# checkov:skip=CKV_TF_1: "Ensure Terraform module sources use a commit hash"
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "~> 16.0"

    project_id   = var.project_id
    network_name = module.vpc.network_name

    subnets = [
        {
            subnet_name           = "subnet-mumbai"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-east1"
        }
]
}
