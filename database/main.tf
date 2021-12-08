resource "random_id" "id" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {
  name             = "sql-master-${random_id.id.hex}"
  region           = "us-east1"
  database_version = "POSTGRES_13"
  deletion_protection = false

  settings {
    tier              = var.sql_instance_size
    disk_type         = var.sql_disk_type
    disk_size         = var.sql_disk_size
    disk_autoresize   = true

    ip_configuration {
      require_ssl  = var.sql_require_ssl
      private_network = var.vpc_id
      ipv4_enabled = false
    }
  }
}

# resource "google_sql_database_instance" "replica" {
#   depends_on = [
#     google_sql_database_instance.master,
#   ]

#   name                 = "master-replica"
#   region               = "us-east1"
#   database_version     = "POSTGRES_13"
#   master_instance_name = google_sql_database_instance.master.name
#   deletion_protection = false

#   settings {
#     tier            = var.sql_instance_size
#     disk_type       = var.sql_disk_type
#     disk_size       = var.sql_disk_size
#     disk_autoresize = true

#   }
# }

resource "google_sql_database" "database" {
    name = "sql"
    instance = google_sql_database_instance.master.name
}

resource "google_sql_user" "user" {
  depends_on = [
    google_sql_database_instance.master,
    # google_sql_database_instance.replica,
  ]

  instance = google_sql_database_instance.master.name
  name     = var.sql_user
  password = var.sql_pass
}