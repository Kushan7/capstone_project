#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

LOG_FILE="/var/log/maintenance_suite.log"

log_message() {
    # Function to print a timestamped message to both screen and log file
    TIMESTAMP=$(date +%Y-%m-%d\ %H:%M:%S)
    echo "[$TIMESTAMP] $1" | tee -a "$LOG_FILE"
}

# ... (Previous configuration variables)

log_message "Starting system backup..."
tar -czf "$BACKUP_FILE" $SOURCE_DIRS 2>> "$LOG_FILE" # Redirect errors to the log

if [ $? -eq 0 ]; then
    log_message "Backup successful! Archive created at: $BACKUP_FILE"
else
    log_message "Backup FAILED! Check $LOG_FILE for details."
    # Exit with an error status for the calling script/menu
    exit 1
fi

# ...
# Configuration variables
BACKUP_DIR="/var/backups/system_data"
SOURCE_DIRS="/etc /home/user /var/log" # Adjust these paths as needed
DATE=$(date +%Y-%m-%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/system_backup_$DATE.tar.gz"

# 1. Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# 2. Perform the backup using tar with gzip compression
echo "Starting system backup..."
tar -czf "$BACKUP_FILE" $SOURCE_DIRS

# 3. Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful! Archive created at: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi

# 4. Optional: Clean up old backups (e.g., keep last 7 days)
# find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete
