#!/bin/bash

# Configuration variables
LOG_FILE="/var/log/syslog" # Change to the log file you need to monitor
KEYWORDS="ERROR|FAIL|CRITICAL"
LINES_TO_CHECK=50

echo "Checking the last $LINES_TO_CHECK lines of $LOG_FILE for issues..."

# Search for the keywords in the recent log entries
ISSUE_COUNT=$(tail -n $LINES_TO_CHECK "$LOG_FILE" | grep -i "$KEYWORDS" | wc -l)

# Check the count and alert if issues are found
if [ "$ISSUE_COUNT" -gt 0 ]; then
    echo "!!! ALERT: $ISSUE_COUNT potential issues found in the log !!!"
    echo "--- Last lines with issues ---"
    tail -n $LINES_TO_CHECK "$LOG_FILE" | grep -i --color=always "$KEYWORDS"
    # In a real-world scenario, you would add an email/SMS notification here
else
    echo "No critical issues found in the last $LINES_TO_CHECK log entries."
fi
