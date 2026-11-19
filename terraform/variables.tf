variable "vms" {
    type = map(object({
        memory_mb = number
        vcpus = number
        disk_gb = number
    }))
}
