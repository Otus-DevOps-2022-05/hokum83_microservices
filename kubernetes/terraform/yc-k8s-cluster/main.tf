provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_kubernetes_cluster" "yc-test-cluster" {
  name        = "yc-test-cluster"
  description = "My test k8s cluster"

  network_id = var.network_id

  master {
    version = "1.20"
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }

    public_ip = true

    }
  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  labels = {
    env       = "test"
  }

  release_channel = "RAPID"
  network_policy_provider = "CALICO"

}


resource "yandex_kubernetes_node_group" "yc-test-node-group" {
  cluster_id  = yandex_kubernetes_cluster.yc-test-cluster.id
  name        = "yc-test-node"
  description = "My test k8s node group"
  version     = "1.20"

  labels = {
    env = "test"
  }

  instance_template {
    platform_id = "standard-v2"
    nat                = true


    resources {
      memory = 8
      cores  = 4
    }

    boot_disk {
      type = "network-ssd"
      size = 64
    }

    scheduling_policy {
      preemptible = false
    }

    metadata = {
      ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
    }
  }

  scale_policy {
    fixed_scale {
      size = 2
    }
  }

  allocation_policy {
    location {
      zone = var.zone
    }
  }

}
