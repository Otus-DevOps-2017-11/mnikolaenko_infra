variable app_disk_image {
  description = "Disk image for reddit data base"
  default     = "reddit-app-base"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable public_key_path {
  description = "Path to the file with the list of public keys used for ssh access"
}

variable "source_ranges" {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}
