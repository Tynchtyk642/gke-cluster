locals {
  hostname = format("%s-bastion", var.bastion_name)
}

resource "google_service_account" "bastion" {
  project      = var.project_id
  account_id   = "bastion-sa"
  display_name = "GKE Bastion Service Account"
}

resource "google_project_iam_binding" "bastion" {
  role = "roles/editor"
  members = [
    "serviceAccount:bastion-sa@${var.project_id}.iam.gserviceaccount.com",
  ]
}

resource "google_compute_instance" "bastion" {
  name         = local.hostname
  machine_type = var.bastion_machine_type
  zone         = var.zone
  tags         = ["public"]
  project      = var.project_id
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  deletion_protection = false

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  metadata_startup_script = var.user_data_path #"sudo yum -y install tinyproxy postgres* && sudo yum -y install kubectl" #&& sudo systemctl start tinyproxy && sudo systemctl enable tinyproxy"

  network_interface {
    subnetwork = var.subnet_name

    access_config {
      network_tier = "STANDARD"
    }
  }

  allow_stopping_for_update = true

  service_account {
    email  = google_service_account.bastion.email
    scopes = ["cloud-platform"]
  }
  # scheduling {
  #   preemptible       = true
  #   automatic_restart = false
  # }
}   