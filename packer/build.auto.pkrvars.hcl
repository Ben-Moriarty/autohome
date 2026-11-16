base_image_url      = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2"
base_image_checksum = "sha512:ec8c175e39d59e711798c3a2f22ba11b9aee9bca1887c7e505a800aeffd5d7616099bd0e9fad869efba96100fe09d2c8b49d6d7001d501f0056c556bdc25b605"

noche_ssh_public_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMzyZSirVh169zAguVf+T1ZTVAlxaYdt2M8KhOG/svDK noche@hosty"
ansible_ssh_public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGKosEMSxkIpi9Cm5tB1MH27K8G8CaFi3uBWezbFSdiC ansible@control"
packer_ssh_public_key       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICer2ghoPdQDLwn6ezcdbLXef0eqj3gOZw2LIYHMruGF packer@hosty"
packer_ssh_private_key_file = "/home/noche/.ssh/packer"
