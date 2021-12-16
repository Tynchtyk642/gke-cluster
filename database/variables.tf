variable "sql_instance_type" {
  description = "Type of Cloud SQL instances"
}

variable "sql_disk_type" {
  description = "Cloud SQL instance disk type"
}

variable "sql_disk_size" {
  description = "Storage size in GB"
}

variable "sql_require_ssl" {
  description = "Enforce SSL connections"
}

variable "sql_connect_retry_interval" {
  description = "The number of seconds between connect retries."
}

variable "sql_user" {
  description = "Username of the host to access the database"
}

variable "sql_pass" {
  description = "Password of the host to access the database"
}

variable "sql_region" {
  description = "Region where sql will crated in."
}


variable "vpc_id" {}

variable "project_id" {}
