#!/bin/bash
#
#==============================
# User Management Script
# =============================
#
#
LOG="user_manager.log"

echo "Run date: $(date)" >> $LOG

# check root permission
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root (use sudo)"
  exit
fi

# ask for username
read -p "Enter new username: " USERNAME


# check if user exists
if id "USERNAME" &>/dev/null; then
  echo "User already exists!"
  exit
fi

# create Group
GROUP="${USERNAME}_group"
groupadd "$GROUP"

# create user
useradd -m -g "$GROUP" "$USERNAME"

# set password
echo "Set password for $USERNAME:"
passwd "$USERNAME"

# create private directory
mkdir -p /home/$USERNAME/private
chown $USERNAME:$GROUP /home/$USERNAME/private
chmod 700 /home/$USERNAME/private

# logging
echo "User $USERNAME created with group $GROUP" >> $LOG
echo "User created successfully!"
