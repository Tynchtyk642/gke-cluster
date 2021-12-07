resource "google_container_cluster" "preview_deploys_app" {
  project  = var.project_id
  name     = var.cluster_name
  location = var.location

  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
  min_master_version       = var.gke_version

  network    = var.network
  subnetwork = var.subnet_name

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.ip_range_pods
    services_ipv4_cidr_block = var.ip_range_services
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = var.authorized_ipv4_cidr_block != null ? [var.authorized_ipv4_cidr_block] : []
    content {
      cidr_blocks {
        cidr_block   = master_authorized_networks_config.value
        display_name = "External Control Plane access"
      }
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  release_channel {
    channel = "UNSPECIFIED"
  }

  addons_config {
    network_policy_config {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  network_policy {
    enabled = true
  }

  node_config {
    tags = var.tags
  }
}


resource "google_container_node_pool" "preview_deploys_app" {
  name               = var.node_pool_name
  location           = google_container_cluster.preview_deploys_app.location
  cluster            = google_container_cluster.preview_deploys_app.name
  initial_node_count = 2

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  node_config {
    preemptible     = false
    machine_type    = var.machine_type
    service_account = ""

    metadata = {
      google-compute-enable-virtio-rng = true
      disable-legacy-endpoint          = true
    }

    oauth_scopes = var.oauth_scopes

    shielded_instance_config {
      enable_secure_boot = true
    }

    labels = {
      cluster = google_container_cluster.preview_deploys_app.name
    }

    tags = var.tags
  }

  lifecycle {
    prevent_destroy = false
    ignore_changes  = [node_config]
  }


  depends_on = [
    google_container_cluster.preview_deploys_app
  ]
}