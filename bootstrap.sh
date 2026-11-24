#!/usr/bin/env bash
set -euo pipefail

cd ansible

ansible-playbook docker.yml
