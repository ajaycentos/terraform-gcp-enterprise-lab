# The VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "enterprise-vpc"
  auto_create_subnetworks = false
}

# The Subnet
resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "enterprise-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true

log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_instance" "enterprise_vm" {
# checkov:skip=CKV_GCP_38:Using default Google-managed encryption for lab VM  
  name         = "enterprise-server"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.vpc_subnet.id
    # No access_config block here = No Public IP!
  }

metadata = {
    block-project-ssh-keys = "true"
  }

shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}


resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-inbound"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # This makes the rule apply only to VMs with the "ssh-server" tag
  target_tags   = ["ssh-server"]
  
  # In a real enterprise, this would be a specific IP range
  source_ranges = ["192.168.1.0/24"] 
}
