#!/usr/bin/env bash
set -euo pipefail

cd ansible

ansible-playbook site.yml --ask-vault-pass
