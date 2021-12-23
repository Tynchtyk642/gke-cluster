# ============================ COMMON VARIABLES =================================

variable "project_id" {
  description = "Project name where the resource will be created."
  type        = string
}

variable "credentials_file_path" {
  description = "Path to your credentials file."
  type        = string
}
variable "region" {
  description = "Region where by default your resource will be created."
  type        = string
}

variable "main_zone" {
  description = "Zone where by default your resource will be created."
  type        = string
}


# ============================= CLUSTER VARIABLES ===============================

variable "cluster_name" {
  description = "Name of the cluster"
}

variable "node_pool_name" {
  description = "Nodes name."
}

variable "machine_type" {
  description = "Cluster nodes type."
}

variable "node_count" {
  description = "Amount of nodes to create."
}

variable "min_node_count" {
  description = "Min amount of nodes for autoscaling."
}

variable "max_node_count" {
  description = "Max amount of nodes for autoscaling."
}

variable "gke_version" {
  description = "The minimum version of the master."
  type        = string
}


# =========================== BASTION VARAIBLES ===============================

variable "bastion_machine_type" {
  type        = string
  description = "Machine type of bastion instance."
}


# ============================ CLOUD SQL VARIABLES ============================

variable "sql_region" {
  description = "Region where sql will created in."
}

variable "sql_instance_type" {
  description = "Cloud SQL instance type."
}

variable "sql_disk_type" {
  description = "Cloud SQL disk type"
}

variable "sql_disk_size" {
  description = "Cloud SQL disk size"
}

variable "sql_user" {
  description = "Cloud SQL user"
}

variable "sql_pass" {
  description = "Cloud SQL password"
}