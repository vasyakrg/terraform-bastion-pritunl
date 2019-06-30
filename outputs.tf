output "pve-servers_ip" {
  value = "${google_compute_instance.pve.*.network_interface.0.access_config.0.nat_ip}"
}

output "bastion_ip" {
  value = "${google_compute_instance.bastion.network_interface.0.access_config.0.nat_ip}"
}
