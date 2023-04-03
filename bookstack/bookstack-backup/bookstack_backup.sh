#!/bin/bash

# Create bookstack DB dump file
mysqldump -u [db_user] -p [user_password] bookstack > bookstack.backup.sql

# Backup bookstack files
tar -czvf bookstack-files-backup.tar.gz /var/www/bookstack/.env /var/www/bookstack/public/uploads /var/www/bookstack/storage/uploads /var/www/bookstack/themes

#Combine and compress DB and file backups into a tar. 
tar -czvf bookstack-backup.tar.gz bookstack-files-backup.tar.gz bookstack.backup.sql 

# Clean up uneeded files.
rm bookstack-files-backup.tar.gz bookstack.backup.sql

echo "Backup Complete"