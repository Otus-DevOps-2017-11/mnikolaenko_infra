variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the file with the list of public keys used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit data base"
  default     = "reddit-db-base"
}

variable backet_tfstate {
  description = "Name of backet that stores tfstate file"
}

variable prefix_tfstate {
  description = "Prefix for backet with tfstate"
}

variable connection_source_range {
  description = "Allowed source IP addresses"
  default     = ["0.0.0.0/0"]
}
