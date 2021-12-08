variable "bastion_name" {
  description = "A unique name for the resource, required by GCE."
  type        = string
  description = "The name to use for the bastion instance."
}

variable "vpc_name" {
  description = "The name or self_link of the network to attach this interface to."
  type        = string
  description = "The name of the network that should be used."
}

variable "subnet_name" {
  description = "The name or self_link of the subnetwork to attach this interface to."
  type        = string
  description = "The name of the subnet that should be used."
}

variable "project_id" {
  description = "Project name where the resource will be created."
  type        = string
  description = "The project ID to host the network in."
}

variable "zone" {
  description = "The zone that the machine should be created in."
  type    = string
  default = "us-central1-b"
}

variable "region" {
  description = "The region that the machine should be created in."
  type    = string
  default = "us-central1"
}