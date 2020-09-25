variable "project" {
  default = ""
}

variable "region" {
  default = "us-central1"
}

#===============================================
# Count of PVE servers
#===============================================
variable "count_instance" {
  default = "3"
}

variable "zone_instance" {
  default = "us-central1-a"
}

variable "disk_image" {
  default = "ubuntu-2004-lts"
}

variable "bastion_tag" {
  default = "bastion-app"
}
