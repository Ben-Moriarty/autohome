build {
  sources = ["source.qemu.debian"]

  provisioner "shell" {
    inline = [
        "echo '===CLOUD INIT CHECK==='",
        "cloud-init status --wait"
    ]
  }
}
