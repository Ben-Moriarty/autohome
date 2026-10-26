#!/usr/bin/env bash
set -euo pipefail

apt-get update -qq
apt-get install -y efibootmgr
apt-get install -y sudo

useradd -m -s noche
# shellcheck disable=SC2016
echo 'noche:$6$HftF1tfIGHuKl2av$XAu32vGDRK4mPrHlLsDq0UF1983kCXuH/Gct2yZzXi./KMPVZvHZHfvj1.kmNRScPPF3fRhc1IxCJv7QK2wvp0' | chpasswd -e
usermod -aG sudo noche

useradd -m -s ansible
# shellcheck disable=SC2016
echo 'ansible:$6$fI7mb.ZO2hWCl263$ntQu9lbLfmyCmt9faR4IoTDJDEDIk8aQgd1.l9RNtqtI/Wtdasua/pa1/t/0uBQ7rQbkgnYuZWb1qHILIVDSM1' | chpasswd -e
usermod -aG sudo ansible
install -d -m 700 -o ansible -g ansible /home/ansible/.ssh
cat > /home/ansible/.ssh/authorized_keys << 'EOF'
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMzyZSirVh169zAguVf+T1ZTVAlxaYdt2M8KhOG/svDK noche@hosty
EOF
chown ansible:ansible /home/ansible/.ssh/authorized_keys
chmod 600 /home/ansible/.ssh/authorized_keys

pveum user add packer@pve
pveum role add PackerBuilder --privs "VM.Allocate VM.Audit VM.Cosnole VM.PowerMgmt VM.Config.CDROM VM.Config.CPU VM.Config.Cloudinit VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options Datastore.AllocateSpace Datastore.Audit Sys.Audit SDN.Use"
pveum acl modify /vms --users packer@pve --roles PackerBuilder

apt purge proxmox-first-boot
