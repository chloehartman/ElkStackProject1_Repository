#! /bin/bash

sudo mkdir -p /var/backup
sudo tar cvf /var/backup/home.tar home
sudo mv /var/backup/home.tar /var/backup/home.0102020.tar
sudo tar cvf /var/backup/system.tar /home
sudo ls -lh /var/backup > /var/backup/filereport.txt
sudo free -h /var/backup/disk_report.txt

 
