provider "google" {
  project = var.project
  region  = var.region
}

#===============================================
# Bucket for .tfstate files - remote save
#===============================================
terraform {
  backend "gcs" {
    bucket = "indigo-medium-242214-tf-state-prod"
    prefix = "test/bastion-app"
  }
}
