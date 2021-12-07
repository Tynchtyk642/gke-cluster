# cloud SQL postgresql outputs

output "master_instance_sql_ipv4" {
  value       = "${google_sql_database_instance.master.ip_address.0.ip_address}"
  description = "The IPv4 address assigned for master"
}

output "uname" {
    value = google_sql_user.user.name
}

output "pass" {
    value = google_sql_user.user.password
}

output "pubip" {
    value = google_sql_database_instance.master.public_ip_address
}

output "dbname" {
    value = google_sql_database.database.name
}