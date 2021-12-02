output "name" {
  value       = google_container_cluster.preview_deploys_app.name
  description = "The Kubernetes cluster name."
}

output "project_id" {
  value = google_container_cluster.preview_deploys_app.project
}

output "zone" {
  value = google_container_cluster.preview_deploys_app.location
}

