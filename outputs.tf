output "Bastion_open_tunnel_command" {
  description = "Command that opens an SSH tunnel to the Bastion instance"
  value       = "${module.bastion.ssh} -N -q -f"
}

output "app_configure_kubectl_command_for_cluster" {
  description = "Command to connect to cluster."
  value = "gcloud container clusters get-credentials ${module.google_kubernetes_cluster_app.name} --zone ${module.google_kubernetes_cluster_app.zone} --project ${module.google_kubernetes_cluster_app.project_id}"
}


output "kubectl_alias_command" {
  description = "Command that creates an alias for kubectl using Bastion as proxy. Bastion ssh tunnel must be running."
  value       = "alias kubectl='${module.bastion.kubectl_command}'"
}

