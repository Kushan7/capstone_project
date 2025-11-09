#!/bin/bash

# Make sure to set the execution permission for all your scripts (chmod +x script_name.sh)

# Function to display the menu
show_menu() {
    echo "========================================="
    echo "  System Maintenance Suite Menu (Wipro)"
    echo "========================================="
    echo "1. Run Automated System Backup"
    echo "2. Run System Updates and Cleanup"
    echo "3. Run Log Monitoring Script"
    echo "4. Exit"
    echo "========================================="
    echo -n "Enter your choice [1-4]: "
}

# Main loop
while true
do
    show_menu
    read CHOICE

    case "$CHOICE" in
        1)
            echo "--- Executing System Backup ---"
            # Ensure backup.sh is executable and in the path
            ./backup.sh
            ;;
        2)
            echo "--- Executing System Updates and Cleanup ---"
            ./update_cleanup.sh
            ;;
        3)
            echo "--- Executing Log Monitoring ---"
            ./log_monitor.sh
            ;;
        4)
            echo "Exiting Maintenance Suite. Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac

    echo "Press Enter to continue..."
    read
done
