#!/bin/sh

# Automated mysql_secure_installation

# # MySQL password Parameter
# NEW_MYSQL_PASSWORD="hubla"

# #Running Expect
# SECURE_MYSQL=$(expect -c "
# set timeout 3
# spawn mysql_secure_installation
# expect \"Enter current password for root (enter for none):\"
# send \"r\"
# expect \"root password?\"
# send \"y\r\"
# expect \"New password:\"
# send \"$NEW_MYSQL_PASSWORD\r\"
# expect \"Re-enter new password:\"
# send \"$NEW_MYSQL_PASSWORD\r\"
# expect \"Remove anonymous users?\"
# send \"y\r\"
# expect \"Disallow root login remotely?\"
# send \"y\r\"
# expect \"Remove test database and access to it?\"
# send \"y\r\"
# expect \"Reload privilege tables now?\"
# send \"y\r\"
# expect eof
# ")
# echo "${SECURE_MYSQL}"


# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('CHANGEME') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE test"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param

systemctl restart mariadb

exit 0