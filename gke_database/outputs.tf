output "name" {
  value       = google_container_cluster.preview_deploys_db.name
  description = "The Kubernetes cluster name."
}

output "project_id" {
  value = google_container_cluster.preview_deploys_db.project
}

output "zone" {
  value = google_container_cluster.preview_deploys_db.location
}
