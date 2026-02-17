#!/bin/bash
#
#========================================
#User Management Script - Delete User
#========================================
#
LOG="delete_user.log"

echo "Run date: $(date)" >> $LOG

# check root permission
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root (use sudo)"
  exit
fi

# Ask for username
read -p "Enter usernsme to dalete: " USERNAME

# check if user exists
if id "$USERNAME" &>/dev/null; then
  # delete user and home directory
  userdel -r "$USERNAME"
  # delete group(if exists)
  GROUP="${USERNAME}_group"
  if getent group "$GROUP" &>/dev/null; then
    groupdel "$GROUP"
  fi
  # logging
  echo "User '$USERNAME' and group $GROUP deleted" >> $LOG
  echo "User '$USERNAME' deleted successfully!"
else
  echo "User '$USERNAME' does not exists"
fi

