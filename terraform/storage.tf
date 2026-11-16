resource "libvirt_volume" "debian_template" {
    name = "debian-template.qcow2"
    pool = default
    source = "${path.module}/../packer/output-debian/packer-debian"
    format = "qcow2"
}
