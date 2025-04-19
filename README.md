# 🛡️ Automated System Backup Solution

![Bash](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

## 📋 Table of Contents
- [Features](#-features)
- [Quick Start](#-quick-start)


## ✨ Features
- 🗄️ Automated compressed backups (.tar.gz)
- ⏳ Configurable retention policy (7 days default)
- 📧 Email failure alerts via local Postfix
- 📝 Detailed activity logging
- ⏰ Pre-configured for cron scheduling

## 🚀 Quick Start

### 1. Install Dependencies
```bash
# For Debian/Ubuntu:
sudo apt update && sudo apt install postfix mailutils tar

# For RHEL/Fedora:
sudo dnf install postfix mailx tar
2. Set Up Script
bash
chmod +x backups.sh
sudo mkdir -p /backups  # Create backup directory
sudo touch /var/log/backup.log  # Create log file
⚙️ Configuration
Edit these variables at the top of backups.sh:

Variable	Example Value	Description
backup_DIR	/backups	Where backups are stored
target_backup	/var/www	Directory to back up
retention_days	7	Days to keep backups
log_file	/var/log/backup.log	Path for log file
Example configuration:

bash
backup_DIR="/mnt/backup_storage"  # Change to your preferred location
target_backup="/home/user/data"    # Change to your target directory
🧪 Testing Procedures
Verify Successful Backup
bash
sudo ./backups.sh

# Check results:
ls -lh /backups/ | grep .tar.gz
tail -n 10 /var/log/backup.log
Test Failure Alerts
bash
# Simulate failure:
sudo chmod 000 /var/www
sudo ./backups.sh

# Check alert:
sudo mail -u root
# Expected subject: "Backup Failed"

# Restore permissions:
sudo chmod 755 /var/www
⏰ Scheduling with Cron
To run daily at 12:05 PM:

Edit root's crontab:

bash
sudo crontab -e
Add this line (replace path):

bash
5 12 * * * /full/path/to/backups.sh >> /var/log/backup.log 2>&1
