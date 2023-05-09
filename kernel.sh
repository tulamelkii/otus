#!/bin/bash
`echo deb https://deb.debian.org/debian bookworm main > /etc/apt/sources.list`
DEBIAN_FRONTEND=noninteractive apt update
DEBIAN_FRONTEND=noninteractive apt-cache search linux-image
DEBIAN_FRONTEND=noninteractive apt install linux-image-6.1.0-8-amd64
echo "Grub update done."
#DEBIAN_FRONTEND=noninteractive apt upgrade -y
shutdown -r now




