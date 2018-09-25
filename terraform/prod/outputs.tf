output "app_external_ip" {
  value = "${module.app.app_external_ip}"
}

output "database_external_ip" {
  value = "${module.db.database_external_ip}"
}
