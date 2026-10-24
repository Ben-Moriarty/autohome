#!/usr/bin/env bash
set -euo pipefail

useradd -m noche
echo 'noche:$6$HftF1tfIGHuKl2av$XAu32vGDRK4mPrHlLsDq0UF1983kCXuH/Gct2yZzXi./KMPVZvHZHfvj1.kmNRScPPF3fRhc1IxCJv7QK2wvp0' | chpasswd -e
usermod -aG sudo noche

useradd ansible
echo 'ansible:$6$fI7mb.ZO2hWCl263$ntQu9lbLfmyCmt9faR4IoTDJDEDIk8aQgd1.l9RNtqtI/Wtdasua/pa1/t/0uBQ7rQbkgnYuZWb1qHILIVDSM1' | chpasswd -e
usermod -aG sudo ansible

apt purge proxmox-first-boot