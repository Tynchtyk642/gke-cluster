locals {
  #======================== GKE-APPLICATION ============================
  cluster_master_ip_cidr_range   = "10.20.20.0/28"
  cluster_pods_ip_cidr_range     = "10.21.0.0/16"
  cluster_services_ip_cidr_range = "10.22.0.0/16"

  #========================== GKE-DATABASE =============================
  cluster_master_ip_cidr_range_db   = "10.20.21.0/28"
  cluster_pods_ip_cidr_range_db     = "10.31.0.0/16"
  cluster_services_ip_cidr_range_db = "10.32.0.0/16"
}
