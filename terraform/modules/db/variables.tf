variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable database_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-database"
}
