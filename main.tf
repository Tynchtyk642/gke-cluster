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

  project_id = var.project_id
  cluster_name               = var.cluster_name
  node_pool_name             = var.node_pool_name
  node_count                 = var.node_count
  machine_type               = var.machine_type
  service_account            = "" #module.bastion.service_account
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

  min_node_count = var.min_node_count
  max_node_count = var.max_node_count
}

module "bastion" {
  source = "./bastion"

  bastion_machine_type = var.bastion_machine_type
  user_data_path       = file("./user_data.sh") # <= Specify path of user_data.sh
  region               = var.region
  project_id           = var.project_id
  zone                 = var.main_zone
  bastion_name         = "app-cluster"
  vpc_name             = "vpc"
  subnet_name          = "presentation-subnet"
}

module "database" {
  source = "./database"

  sql_region                 = var.sql_region
  project_id                 = var.project_id
  sql_instance_type          = var.sql_instance_type
  sql_disk_type              = var.sql_disk_type
  sql_disk_size              = var.sql_disk_size
  sql_require_ssl            = false
  sql_connect_retry_interval = 60
  sql_user                   = var.sql_user
  sql_pass                   = var.sql_pass

  vpc_id = "projects/${var.project_id}/global/networks/vpc" # <<== VPC ID
}