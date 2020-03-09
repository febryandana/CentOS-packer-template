#!/bin/sh

# Disable local time
timedatectl set-local-rtc 0

# Install EPEL (Extra Package for Enterprise Linux)
#dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
yum -y install epel-release
yum -y install 'dnf-command(config-manager)'
yum config-manager --set-enabled PowerTools

# Update & Upgrade system
yum -y update
yum -y upgrade

# Install service
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