variable "base_image_url" {
    type = string
}

variable "base_image_checksum" {
    type = string
}

variable "packer_ssh_public_key" {
    type = string
}

variable "packer_ssh_private_key_file" {
    type = string
}

variable "noche_ssh_public_key" {
    type = string
}

variable "noche_ssh_private_key_file" {
    type = string
}

variable "ansible_ssh_public_key" {
    type = string
}

variable "ansible_ssh_private_key_file" {
    type = string
}
