variable "project_id" {
  type    = string
  default = ""
}

variable "cluster_name" {
  type    = string
  default = "preview-deploys-db"
}

variable "location" {
  type    = string
  default = "us-central1-b"
}

variable "initial_node_count" {
  type    = number
  default = 1
}

variable "network" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "ip_range_pods" {
  type = string
}

variable "ip_range_services" {
  type = string
}

variable "master_ipv4_cidr_block" {
  type = string
}

variable "tags" {
  type = list(string)
}

#============================= NODE POOL ===================================

variable "node_pool_name" {
  type    = string
  default = "preview-deploys-db"
}

variable "min_node_count" {
  type    = number
  default = 3
}

variable "max_node_count" {
  type    = number
  default = 15
}

variable "auto_repair" {
  type    = bool
  default = true
}

variable "auto_upgrade" {
  type    = bool
  default = true
}

variable "machine_type" {
  type    = string
  default = "g1-small"
}

variable "oauth_scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}

variable "authorized_ipv4_cidr_block" {
  type    = string
  default = null
}
