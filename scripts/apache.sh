chmod -R 755 /var/www
mkdir -p /var/www/febryan.com/html
mkdir -p /var/www/febryan.com/log
chown -R $USER:$USER /var/www/febryan.com/html

echo '<html>
  <title>\nWelcome to Example.com!\n</title>
  <body>
    <h1>Success! The example.com virtual host is working!</h1>
  </body>
</html>
' > /var/www/febryan.com/html/index.html

mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled
echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf
