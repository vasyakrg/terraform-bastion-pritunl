#===============================================
# Create PVE servers
#===============================================
resource "google_compute_instance" "pve" {
  count        = "${var.count_instance}"
  name         = "serv-${count.index + 1}"
  machine_type = "g1-small"
  zone         = "${var.zone_instance}"
  tags         = ["serv-${count.index + 1}"]

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

  connection {
    host        = self.network_interface.0.access_config.0.nat_ip
    type        = "ssh"
    user        = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install nginx -y",
      "echo Serv-${count.index + 1} >> /var/www/html/index.nginx-debian.html",
      "systemctl enable nginx && systemctl start nginx"
    ]
  }
}
