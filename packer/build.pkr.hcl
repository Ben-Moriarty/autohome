build {
  sources = ["source.qemu.debian"]

  provisioner "shell" {
    inline = ["cloud-init status --wait"]
  }

  provisioner "shell" {
    inline = ["systemctl is-active --quiet qemu-guest-agent"]
  }
}
