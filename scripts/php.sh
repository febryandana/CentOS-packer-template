#!/bin/sh

# Install php
yum -y install php php-common php-mysqlnd

# Create php info page
touch /var/www/html/info.php
echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

