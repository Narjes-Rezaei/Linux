# Linux User Management Project

## 📝 Project Description
This project is a **simple Linux user management system** implemented with Bash scripts. It allows you to **add, delete, and view users** interactively. The goal is to practice **Bash scripting**, Linux user management, and create a **realistic interactive menu system**.

---

## 📂 Folder Contents
- `add_user.sh` : Script to add a new user with the following features:
  - Root permission check
  - Create a dedicated group for the user
  - Create a private directory for the user (`/home/username/private`) with secure permissions
  - Set user password
  - Log all actions in `user_manager.log`

- `delete_user.sh` : Script to delete an existing user with the following features:
  - Root permission check
  - Delete user and their home directory
  - Delete the user's dedicated group (if it exists)
  - Log all actions in `user_manager.log`

- `user_manager.log` : Log file that records all add and delete operations (automatically created if it doesn’t exist).

---

## ⚡ Prerequisites
- Linux or WSL
- **Root** access or use of `sudo` to run scripts
- Bash shell

---

## 🚀 How to Run
1. **Make scripts executable:**
```bash
chmod +x add_user.sh delete_user.sh

2. **Add a new user:**
sudo ./add_user.sh


3. **Delete an existing user:**

sudo ./delete_user.sh


⚠️ Note: Always run with root permissions for proper user and group creation/deletion.

🌟 Features

Enforces execution with root permission
Dedicated group management for each user
Creation of private directories with secure permissions (700)
User password management
Detailed logging of all actions for tracking

📌 Additional Notes

If user_manager.log does not exist, the script will create it automatically.
Dedicated user groups follow the naming convention username_group and are deleted when the user is deleted.

