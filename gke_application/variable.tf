variable "project_id" {
  description = "Project name where the resource will be created."
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "The name of the cluster."
  type        = string
  # default     = "sandbox-deploys-app"
}

variable "location" {
  description = "GKE cluster location."
  type        = string
  default     = "us-central1-b"
}

variable "initial_node_count" {
  description = "The number of nodes to create in this cluster's default node pool."
  type        = number
  default     = 1
}

variable "network" {
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected."
  type        = string
}

variable "subnet_name" {
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
  type        = string
}

variable "ip_range_pods" {
  description = "The IP address range for pod IPs in this nodes pool."
  type        = string
}

variable "ip_range_services" {
  description = "The IP address range of the services IPs in this cluster."
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network."
  type        = string
}

variable "tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(string)
}

variable "service_account" {
  description = "The Google Cloud Platform Service Account to be used by the node VMs"
}

#============================= NODE POOL ===================================

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
  # default     = "sandbox-deploys-app"
}

variable "gke_version" {
  description = "The minimum version of the master."
  type        = string
}

variable "min_node_count" {
  description = "Minimum number of nodes in the NodePool."
  type        = number
  # default     = 3
}

variable "max_node_count" {
  description = "Maximum number of nodes in the NodePool."
  type        = number
  # default     = 15
}

variable "auto_repair" {
  description = "Whether the nodes will be automatically repaired."
  type        = bool
  default     = true
}

variable "auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded."
  type        = bool
  default     = true
}

variable "machine_type" {
  description = "The name of a Google Compute Engine machine type."
  type        = string
  # default     = "g1-small"
}

variable "oauth_scopes" {
  description = "Scopes that are used by NAP when creating node pools."
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}

variable "authorized_ipv4_cidr_block" {
  description = "The desired configuration options for master authorized networks."
  type        = string
  # default     = null
}

variable "resource_labels" {
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster."
  type        = map(any)
  default     = {}
}

variable "node_count" {
  description = "Amount of nodes to create"
  type = number
}



