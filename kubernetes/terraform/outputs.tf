output "external_ip_address_k8s_masters" {
  value = module.master.external_ip_address_master
}
output "external_ip_address_k8s_workers" {
  value = module.worker.external_ip_address_worker
}
