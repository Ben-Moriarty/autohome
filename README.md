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


### upnext?
* visibility on what stage pipeline is on and different logs would be nice (pxe stage show dnsmasq, caddy, maybe packet capture)
* finish terraform
* actually encrypt zkeys.yaml w/ sops
* stop hardcoding ips everywhere
* centralize all secrets (api tokens, ssh, passwords) in vault/openbao. sops + age only for the bootstrap secrets, github actions logs in w/ oidc, ssh certs instead of copying keys around
