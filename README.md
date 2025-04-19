# scored-task1

task (1)
How to Run and Test the Script
1 - Make the script executable:
chmod +x backups.sh
2 - Run the script manually to test:
sudo ./backups.sh
3 - Verify results:
Check that a backup file was created in /backups directory
Verify the log entry in /var/log/backup.log
The backup file should be named backup_DD-MM-YYYY.tar.gz

How to Configure Paths and Retention
Edit the following variables at the top of the script to customize behavior:

backup_DIR="/backups"        # Where backup files are stored
target_backup="/var/www"     # Directory to backup
log_file="/var/log/backup.log"  # Log file location
retention_days=7             # How many days to keep backups

How to Test the Failure Alert
1 - Temporarily modify the script to target a non-existent directory:
target_backup="/path/that/does/not/exist"
2 - Ensure mail is properly configured on your system:
sudo apt-get install mailutils   # For Debian/Ubuntu
# or
sudo yum install mailx          # For RHEL/CentOS/fedora
3 - Run the script:
sudo ./backups.sh
4 - Check the email sent to root (or configure a different email in the script)
5 - Remember to revert the target directory change after testing

Note: The script is configured to run daily at 12:05 PM via crontab. The default cron entry is:
5 12 * * * /path/to/backups.sh
