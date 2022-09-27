variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable image_id {
  default     = "ubuntu-1804-lts"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable private_key_path {
  description = "Path to the private key used for ssh access"
}
variable icount {
  default     = "1"
}
variable ssh_user {
  default = "ubuntu"
}
