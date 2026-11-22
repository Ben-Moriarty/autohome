# autohome

main idea of this project is to fully automate the setup of my homelab from bare metal


### whats done so far
* pxe server on a debian vm (dnsmasq proxy dhcp + tftp, caddy serving the http stuff, ipxe)
* proxmox unattended install over pxe w/ an answer file, iso gets prepped by proxmox-auto-install-assistant
* firstboot script for proxmox that makes my users, drops ssh keys, and sets up a packer user + api token
* playbook to flip the proxmox host to pxe on next boot and reboot it
* playbook to revert the pxe vm back to a clean snapshot so i can rerun everything from scratch
* `site.yml` that chains it all together (revert vm -> monitoring -> pxe server -> pxe boot proxmox)
* monitoring: grafana + loki + alloy, shipping caddy, dnsmasq and a tcpdump packet capture of the pxe traffic. has a dashboard for it
* secrets w/ ansible vault, plus sops + age set up (still kinda halfway)
* packer builds a debian 13 template from the cloud image w/ cloud-init (users, keys, qemu guest agent)
* roles to install docker and packer on a box
* pre-commit w/ ansible-lint, shellcheck and the usual whitespace stuff
* terraform just started, libvirt provider to pull in the packer image
* deploy workflow started (`.github/workflows/deploy.yml`), manual run of `site.yml` on a self-hosted runner. same file works for github actions and forgejo actions, vault password comes from a ci secret via `vault_pass.sh`


### upnext?
* visibility on what stage pipeline is on and different logs would be nice (pxe stage show dnsmasq, caddy, maybe packet capture)
* finish terraform
* actually encrypt zkeys.yaml w/ sops
* stop hardcoding ips everywhere
* centralize all secrets (api tokens, ssh, passwords) in vault/openbao. sops + age only for the bootstrap secrets, github actions logs in w/ oidc, ssh certs instead of copying keys around
* one command bootstrap: clone on any machine + vault password -> `./bootstrap.sh` -> whole lab comes up. script pulls pinned tools into `./.tools` (uv for ansible, packer + terraform binaries w/ checksums), no docker or installs needed. ci uses the same script so versions always match
* runners (github + forgejo) get deployed as part of the lab, not a separate machine. bootstrap builds the lab, then the runners take over for changes after that. later make them ephemeral in containers
* revert snapshot play should ssh to the libvirt host instead of running virsh on localhost, so the runner can live anywhere (and never on the pxe vm since it reverts itself)
