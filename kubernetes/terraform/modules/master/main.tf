resource "yandex_compute_instance" "master" {
  count = var.icount
  name  = "k8s-master-${count.index}"

  labels = {
    tags = "master"
  }

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  provisioner "remote-exec" {
    inline = ["sudo rm /var/lib/apt/lists/lock & sudo rm /var/cache/apt/archives/lock & sudo rm /var/lib/dpkg/lock* & sudo apt update & sudo apt install python3 -y"]

    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file(var.private_key_path)}"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ${var.ssh_user} -i '${self.network_interface.0.nat_ip_address},' --private-key ${var.private_key_path} ../ansible/playbooks/install-master.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "${var.ssh_user}"
    agent       = false
    private_key = file(var.private_key_path)
  }
}
