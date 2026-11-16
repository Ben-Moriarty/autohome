source "qemu" "debian" {
  iso_url      = var.base_image_url
  iso_checksum = var.base_image_checksum

  disk_image = true
  format     = "qcow2"

  ssh_username         = "packer"
  ssh_private_key_file = var.packer_ssh_private_key_file

  cd_label = "cidata"
  cd_content = {
    "meta-data" = ""
    "user-data" = templatefile("${path.root}/user-data.pkrtpl.hcl", {
      noche_ssh_public_key   = var.noche_ssh_public_key
      ansible_ssh_public_key = var.ansible_ssh_public_key
      packer_ssh_public_key  = var.packer_ssh_public_key
    })
  }

  memory      = 2048
  cpus        = 2
  accelerator = "kvm"

  headless = true

  shutdown_command = "sudo cloud-init clean --logs && sudo shutdown -P now"
}
