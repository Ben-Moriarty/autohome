resource "libvirt_cloudinit_disk" "vm_init" {
    for_each = var.vms
    name = "${each.key}-init.iso"
    pool = libvirt_volume.debian_template.pool
    user_data = templatefile("${path.module}/user-data.tftpl", { hostname = each.key })
}
