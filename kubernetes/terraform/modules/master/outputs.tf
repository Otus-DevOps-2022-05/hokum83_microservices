output "external_ip_address_master" {
  value = join(" ", yandex_compute_instance.master[*].network_interface.0.nat_ip_address)
}
