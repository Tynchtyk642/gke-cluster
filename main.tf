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

provider "google" {
  credentials = file(var.credentials_file_path)

  project = var.project_id
  region  = var.region
  zone    = var.main_zone
}

module "google_kubernetes_cluster_app" {
  source = "./gke_application"

  gke_version                = "1.20"
  location                   = "us-central1-a"
  network                    = "vpc"
  subnet_name                = "application-subnet"
  ip_range_pods              = local.cluster_pods_ip_cidr_range
  ip_range_services          = local.cluster_services_ip_cidr_range
  master_ipv4_cidr_block     = local.cluster_master_ip_cidr_range
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
  tags                       = ["application"]
}

module "google_kubernetes_cluster_db" {
  source = "./gke_database"

  gke_version                = "1.20"
  location                   = "us-central1-a"
  network                    = "vpc"
  subnet_name                = "database-subnet"
  ip_range_pods              = local.cluster_pods_ip_cidr_range_db
  ip_range_services          = local.cluster_services_ip_cidr_range_db
  master_ipv4_cidr_block     = local.cluster_master_ip_cidr_range_db
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
  tags                       = ["database"]
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