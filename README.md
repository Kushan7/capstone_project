# 💻 Capstone Project: Linux System Maintenance Suite
Project Overview
This repository contains a comprehensive suite of Bash scripts designed to automate routine system administration and maintenance tasks on a Linux environment. Developed as part of the Wipro Capstone project requirement, this suite provides crucial functionalities like automated backups, system updating, clean-up, and real-time log monitoring.

Objective: To write a robust, error-handling suite of Bash scripts, accessible via a user-friendly menu, to enhance system stability and reduce manual administrative overhead.

Key Features
The maintenance suite is accessed via a single menu script (maintainance_suite.sh) and provides the following core functions:

System Backup (backup.sh): Automates the compression and archival of critical system directories (e.g., /etc, /home, /var/log) to a designated backup location with a timestamp.

Updates & Cleanup (update_cleanup.sh): Performs necessary OS package updates (apt update/upgrade) and cleans up old dependencies and cached package files to free up disk space.

Log Monitoring (log_monitor.sh): Actively scans the most recent lines of the system log (/var/log/syslog) for critical keywords (ERROR, FAIL, CRITICAL) and alerts the user if issues are detected.

Error Handling & Logging: Each script includes robust error handling (set -e) and directs all actions, warnings, and errors to a centralized log file (/var/log/maintenance_suite.log) for review.

## 🚀 Getting Started
Prerequisites
A running Linux distribution (tested on Ubuntu/Debian, easily adaptable to RHEL/CentOS).

Bash shell access.

Sudo privileges may be required for certain scripts (e.g., updates).

Installation and Setup
Clone the Repository:

Bash

git clone https://github.com/Kushan7/capstone_project.git
cd capstone_project
Set Execution Permissions: All scripts must be executable.

Bash

chmod +x *.sh
Run the Main Suite: Execute the master menu script to launch the interface.

Bash

./maintainance_suite.sh
## 📜 How to Use the Maintenance Suite
Upon execution, the main script presents a menu:

=========================================
  System Maintenance Suite Menu (Wipro)
=========================================
1. Run Automated System Backup
2. Run System Updates and Cleanup
3. Run Log Monitoring Script
4. Exit
=========================================
Enter the corresponding number (1, 2, or 3) and press Enter to run the desired task.

Configuration Notes:
Backup Paths: Review and modify the SOURCE_DIRS variable inside backup.sh to include or exclude specific directories in the backup.

Log Monitoring: The keywords and the log file path (LOG_FILE) checked by log_monitor.sh should be adjusted based on the specific application logs you intend to monitor.

## 🛡️ Error Handling and Centralized Logging
All script output is carefully logged to a centralized file: /var/log/maintenance_suite.log.

This log is timestamped and records:

Start and finish times for each task.

Successful completion messages.

Any command failures or errors captured during script execution, ensuring operational transparency.
