#!/bin/sh

# Install LAMP Stack + expect
yum -y install httpd mariadb mariadb-server php php-common php-mysqlnd expect
systemctl start httpd.service
systemctl enable httpd.service
systemctl start mariadb
systemctl enable mariadb

# Configure firewall for http & https
sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

# Create php info file
touch /var/www/html/info.php
echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

# Automated mysql_secure_installation
# MySQL password Parameter
NEW_MYSQL_PASSWORD="hubla"

# Running Expect
SECURE_MYSQL=$(expect -c "
set timeout 3
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"\r\"
expect \"root password?\"
send \"y\r\"
expect \"New password:\"
send \"$NEW_MYSQL_PASSWORD\r\"
expect \"Re-enter new password:\"
send \"$NEW_MYSQL_PASSWORD\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")
echo "${SECURE_MYSQL}"

yum -y update tzdata
systemctl restart mariadb

# Install console based browser
yum -y --enablerepo=PowerTools install links

exit 0