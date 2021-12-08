output "name" {
  value       = google_container_cluster.preview_deploys_db.name
  description = "The Kubernetes cluster name."
}

output "project_id" {
  description = "Project GKE cluster created in."
  value = google_container_cluster.preview_deploys_db.project
}

output "zone" {
  description = "The zone GKE cluster created in."
  value = google_container_cluster.preview_deploys_db.location
}
