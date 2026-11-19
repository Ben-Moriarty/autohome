resource "libvirt_volume" "vm_disk" {
    for_each = var.vms
    name = "debian-${each.key}.qcow2"
    pool = libvirt_volume.debian_template.pool
    base_volume_id = libvirt_volume.debian_template.id
    size = each.value.disk_gb * 1024 * 1024 * 1024
}
