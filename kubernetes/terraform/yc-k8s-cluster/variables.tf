variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  description = "Path to the private key used for ssh access"
}
variable image_id {
  description = "Ubuntu disk image"
}
variable subnet_id {
  description = "Subnet"
}

variable network_id {
  description = "Network"
}
variable service_account_key_file {
  description = "key.json"
}
variable icount {
  default = "1"
}
variable ssh_user {
  default = "ubuntu"
}
variable service_account_id {
}
