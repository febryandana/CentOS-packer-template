# Packer Template for CentOS 8

Template packer untuk OS CentOS 8, hasilnya berupa file virtualbox (ovf dan vmdk)

## Prasyarat
  * Packer (www.packer.io)
  * Virtualbox (www.virtualbox.org)
  * ISO Images - CentOS 8 (www.centos.org)
  * Text Editor - optional

## Langkah Kerja
  - Install virtualbox di host machines
  - Download & Install Packer ke sistem
  - Jalankan Packer dengan template yang sudah dibuat

## Penggunaan Packer
  1. Download paket packer dari website
  2. Extract paket packer, hasilnya adalah satu file bernama "packer"
  3. Pindah/salin file packer ke /usr/lib/bin
      $ mv packer /usr/lib/bin
  4. Update PATH packer
      $ export PATH=$PATH:/usr/lib/bin/packer
      $ source ~/.bashrc
  5. Jalankan Packer
      * Validasi file template packer :
          $ packer validate template.json
      * Build Packer Virtualbox Images :
          $ packer build template.json
  
  
  
  ### Author
  Moch. Febryandana Nurfahri (febryandana.fd@gmail.com)
