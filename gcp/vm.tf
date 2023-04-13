resource "google_compute_instance" "default" {
  name         = "terraform-vm"
  machine_type = "e2-micro"
  zone         = "us-east1-c"
  tags         = ["terraform"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20230302"
    }
  }

  network_interface {
    network = "internet2-gcpvpc"
    subnetwork = "internet2-gcpsubnet1"
    access_config {
      #network_tier = "Premium"
    }
  }

  metadata_startup_script = "sudo su | apt-get update | apt install net-tools"

}
