terraform {
  # backend "gcs" {
  #   bucket = ""
  #   prefix = ""
  # }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.53.0"
    }
  }
}

provider "google-beta" {
  credentials = file(var.credentials_file_path)
  project     = var.project_id
}

provider "google" {
  credentials = file(var.credentials_file_path)

  project = var.project_id
  region  = var.region
  zone    = var.main_zone
}

module "google_kubernetes_cluster_app" {
  source = "./gke_application"

  gke_version                = var.gke_version
  location                   = "us-central1-a"
  network                    = "vpc"
  subnet_name                = "application-subnet"
  ip_range_pods              = local.cluster_pods_ip_cidr_range
  ip_range_services          = local.cluster_services_ip_cidr_range
  master_ipv4_cidr_block     = local.cluster_master_ip_cidr_range
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
  tags                       = ["application"]
  resource_labels            = {}
}

module "bastion" {
  source = "./bastion"

  region       = var.region
  project_id   = var.project_id
  zone         = var.main_zone
  bastion_name = "app-cluster"
  vpc_name     = "vpc"
  subnet_name  = "presentation-subnet"
}

# module "database" {
#   source = "./database"

#   sql_instance_size          = "db-f1-micro"
#   sql_disk_type              = "PD_SSD"
#   sql_disk_size              = 10
#   sql_require_ssl            = false
#   sql_connect_retry_interval = 60
#   sql_user                   = "admin"
#   sql_pass                   = "password"

#   vpc_id = "projects/universal-fort-327003/global/networks/vpc" # <<== VPC ID
# }