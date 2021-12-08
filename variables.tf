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

variable "gke_version" {
  description = "The minimum version of the master."
  type = string
}