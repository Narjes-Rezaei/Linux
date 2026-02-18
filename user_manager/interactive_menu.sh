#!/bin/bash

# ===============================
# Linux User Management - Interactive Menu
# ===============================

LOG="user_manager.log"

# Function to check root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script as root (use sudo)"
        exit
    fi
}

# Function to add user
add_user() {
    read -p "Enter new username: " USERNAME

    if id "$USERNAME" &>/dev/null; then
        echo "User already exists!"
        return
    fi

    GROUP="${USERNAME}_group"
    groupadd "$GROUP"
    useradd -m -g "$GROUP" "$USERNAME"

    echo "Set password for $USERNAME:"
    passwd "$USERNAME"

    mkdir -p /home/$USERNAME/private
    chown $USERNAME:$GROUP /home/$USERNAME/private
    chmod 700 /home/$USERNAME/private

    echo "User $USERNAME created with group $GROUP" >> $LOG
    echo "User '$USERNAME' created successfully ✅"
}

# Function to delete user
delete_user() {
    read -p "Enter username to delete: " USERNAME

    if id "$USERNAME" &>/dev/null; then
        userdel -r "$USERNAME"

        GROUP="${USERNAME}_group"
        if getent group "$GROUP" &>/dev/null; then
            groupdel "$GROUP"
        fi

        echo "User $USERNAME and group $GROUP deleted" >> $LOG
        echo "User '$USERNAME' deleted successfully ✅"
    else
        echo "User '$USERNAME' does not exist ❌"
    fi
}

# Function to list users
list_users() {
    echo "=== List of users on system ==="
    awk -F: '$3 >= 1000 && $7 !~ /(nologin|false)/ {print $1}' /etc/passwd
    echo "==============================="
}

# Interactive menu
check_root
while true; do
    echo ""
    echo "===== Linux User Management Menu ====="
    echo "1) Add User"
    echo "2) Delete User"
    echo "3) List Users"
    echo "4) Exit"
    echo "====================================="
    read -p "Choose an option [1-4]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) echo "Exiting..."; exit ;;
        *) echo "Invalid option, try again!" ;;
    esac
done

