variable "bastion_name" {
  type        = string
  description = "The name to use for the bastion instance."
}

variable "vpc_name" {
  type        = string
  description = "The name of the network that should be used."
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet that should be used."
}

variable "project_id" {
  type        = string
  description = "The project ID to host the network in."
}

variable "zone" {
  type    = string
  default = "us-central1-b"
}

variable "region" {
  type    = string
  default = "us-central1"
}