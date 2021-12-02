# Terraform GCP GKE-clusters with Bastion Host

## This codes create:

1. ### Two private gke-clusters with `node_pool`:
    - _Application cluster_
    - _Database cluster_
2. ### Bastion Host with Identity aware proxy (IAP) for a secure access.

## **Diagram**
![](diagram/gke.png)

## **Usage**
Then perform the following commands on the root folder:
- `terraform init` terraform initialization
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply infrastructure build
- `terraform output` to see the outputs
- `terraform destroy` to destroy the build infrastructure

```terraform
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone

  credentials = file(var.credentials_file)
}

module "google_kubernetes_cluster_app" {
  source = "./gke_application"

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

```