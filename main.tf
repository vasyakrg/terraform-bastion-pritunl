#===============================================
# Create firefall for bastion server
#===============================================
resource "google_compute_firewall" "firewall_vpn" {
  name = "allow-vpn"

  # name of net
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  #   computing port!

  # allow {
  #   protocol = "udp"
  #   ports    = [""]
  # }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.bastion_tag]
}

#===============================================
# Create bastion server
#===============================================
resource "google_compute_instance" "bastion" {
  name         = "app-bastion"
  machine_type = "g1-small"
  zone         = "${var.zone_instance}"
  tags         = ["${var.bastion_tag}"]

  # add image disk
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  # add network
  network_interface {
    network = "default"
    access_config {
    }
  }
  # ssh_key
  metadata = {
    sshKeys = "root:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = "${file("scripts/setupvpn.sh")}"
}
