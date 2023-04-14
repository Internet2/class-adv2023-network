# Define VPC
resource "google_compute_network" "main" {
  name                    = "main-vpc"
  auto_create_subnetworks = false
}


# Define subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  ip_cidr_range = var.gcp_public_subnet_cidr_block
  network       = google_compute_network.main.self_link
  region        = var.gcp_region
}

# Define subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = var.gcp_private_subnet_cidr_block
  network       = google_compute_network.main.self_link
  region        = var.gcp_region
}