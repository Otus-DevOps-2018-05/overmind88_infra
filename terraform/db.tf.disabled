resource "google_compute_instance" "database" {
  name         = "reddit-database"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-database"]

  boot_disk {
    initialize_params {
      image = "${var.database_disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["2707"]
  }

  target_tags = ["reddit-database"]
  source_tags = ["reddit-app"]
}
