output "app_external_ip" {
  value = "${module.app.app_external_ip}"
}

output "database_external_ip" {
  value = "${google_compute_instance.database.network_interface.0.access_config.0.assigned_nat_ip}"
}
