variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image for reddit app"
  default     = "reddit-docker-base"
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
