provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "master" {
  source           = "./modules/master"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  image_id         = var.image_id
  subnet_id        = var.subnet_id
  icount           = var.masters_count
}

module "worker" {
  source           = "./modules/worker"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  image_id         = var.image_id
  subnet_id        = var.subnet_id
  icount           = var.workers_count
  master_ip_address = module.master.external_ip_address_master
}
