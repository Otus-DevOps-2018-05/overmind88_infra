variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable zone {
  description = "Zone"
}

variable database_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-database"
}

variable database_ip {
  description = "Internal ip-address"
  default     = "0.0.0.0"
}
