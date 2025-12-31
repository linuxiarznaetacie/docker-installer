#!/bin/bash

# Copyright (c) 2025 Jakub Orłowski
# Licensed under the MIT License. See LICENSE for details.

set -e 

sudo apt update && clear
sudo apt install ca-certificates curl -y && clear

sudo install -m 0755 -d /etc/apt/keyrings && clear
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && clear
sudo chmod a+r /etc/apt/keyrings/docker.asc && clear

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

clear && sudo apt update && clear

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y && sudo systemctl enable docker --now && clear

echo "Pomyślnie zainstalowano Dockera!"



