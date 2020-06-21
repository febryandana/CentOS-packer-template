# Packer Template for CentOS 8 (Plus Web Server httpd, mariaDB, php)

This template is for virtualbox use, outputs will be ovf and vmdk file


### Requirements
  * [Packer](www.packer.io)
  * [Virtualbox](www.virtualbox.org)
  * ISO Images - [CentOS 8](www.centos.org)
  * Text Editor - Whatever you like

### Steps
  1. Install virtualbox in host machine
  2. Download & Install Packer to host machine
  3. Run Packer with the template

### How to Use Packer
  1. Download packer from the website
  2. Extract packer, the output is a file named "packer"
  3. Move/copy the file to /usr/lib/bin
      ```
      $ mv packer /usr/lib/bin`
      ```
  4. Update PATH to packer
      ```
      $ export PATH=$PATH:/usr/lib/bin/packer
      $ source ~/.bashrc
      ```
  5. Run Packer
      5.1. Validate file template packer :
           ```
           $ packer validate template.json
           ```
      5.2. Build Packer Virtualbox Image :
           ```
           $ packer build template.json
           ```
  
  

##### Author
Moch. Febryandana Nurfahri (febryandana.fd@gmail.com)
