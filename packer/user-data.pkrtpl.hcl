#cloud-config
hostname: debian-template
preserve_hostname: false
timezone: UTC
manage_etc_hosts: true
resize_rootfs: true
locale: en_US.UTF-8

ssh_deletekeys: true
ssh_genkeytypes: [ed25519]
ssh_quiet_keygen: true
ssh_pwauth: false
disable_root: true

package_update: true
packages:
  - qemu-guest-agent

runcmd:
  - systemctl start qemu-guest-agent

users:
  - name: noche
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    lock_passwd: true
    ssh_authorized_keys: ["${noche_ssh_public_key}"]

  - name: ansible
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    lock_passwd: true
    ssh_authorized_keys: ["${ansible_ssh_public_key}"]

  - name: packer
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    lock_passwd: true
    ssh_authorized_keys: ["${packer_ssh_public_key}"]

power_state:
  mode: poweroff
  condition: true

final_message: "cloud init is totall finished brother after $UPTIME seconds"
