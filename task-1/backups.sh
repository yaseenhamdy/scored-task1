#!/bin/bash

# Variables
backup_DIR="/backups"
today_date=$(date +%d-%m-%Y)
retention_days=7  # Fixed typo (was 'dayes')
target_backup="/var/www"
log_file="/var/log/backup.log"

mkdir -p "$backup_DIR"
backup_file="$backup_DIR/backup_$today_date.tar.gz"

echo "Starting Backup"  

tar -czf "$backup_file" "$target_backup"

if [ $? -eq 0 ]; then  
  echo "Backup Successfully of => backup_$today_date" >> "$log_file"
else
  echo "Backup Failed of => backup_$today_date" >> "$log_file"
  echo "Backup Failed, Check $log_file for details" | mail -s 'Backup Failed' root
fi


find "$backup_DIR" -name "backup_*.tar.gz" -mtime +$retention_days -delete
echo "Removed backups older than "$retention_days" days" >> "$log_file"



