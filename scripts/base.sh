#!/bin/sh

# Disable local time
timedatectl set-local-rtc 0

# Install EPEL (Extra Package for Enterprise Linux)
yum -y install epel-release
yum -y install 'dnf-command(config-manager)'
yum config-manager --set-enabled PowerTools

# Update & Upgrade system
yum -y update
yum -y upgrade

# Install firewall & dkms services
yum -y install dkms firewalld

# Start firewall
systemctl start firewalld
systemctl enable firewalld

# Install VBox Guest Additions
VBOX_VERSION=$(cat /root/.vbox_version)
mount -o loop /root/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

exit 0