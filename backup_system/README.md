# 🗂 Linux Backup Utility

A simple yet powerful Bash-based backup and restore system for Linux.

This tool allows you to:
- Create compressed backups (.tar.gz)
- Restore backups safely
- Automatically remove old backups
- Use both CLI mode and Interactive Menu mode

---

## 🚀 Features

- ✅ Compressed backups using `tar`
- ✅ Restore functionality
- ✅ Retention policy (keeps last 5 backups)
- ✅ Colored terminal output
- ✅ Animated progress indicator
- ✅ CLI support (`--backup`, `--restore`, `--list`, `--help`.)
- ✅ Interactive menu mode
- ✅ Logging system (`Backup_log.log`)

---

## 📦 Installation

Clone the repository:

```bash
git clone https://github.com/Narjes-Rezaei/Linux.git

cd backup-system

Make the script executable:

chmod +x backup.sh

Run:

./backup.sh
🖥 Usage
🔹 Interactive Mode

Just run:

./backup.sh

You will see:

1) Backup
2) Restore
3) List
4) Help
5) Exit
🔹 CLI Mode

Create backup:

./backup.sh --backup

Restore backup:

./backup.sh --restore

List backups:

./backup.sh --list

Show help:

./backup.sh --help
📁 Backup Structure

Backups are stored inside:

Backups/

Each backup is named:

Backup_YYYY-MM-DD_HH-MM-SS.tar.gz
🔁 Retention Policy

The script automatically keeps only the latest 5 backups.
Older backups are deleted automatically.

📝 Log File

All operations are logged in:

Backup_log.log
⚙ Configuration

Inside the script you can modify:

SOURCE_DIR="/home/linux-ubuntu/Downloads/project_1"
MAX_BACKUPS=5
🛠 Technologies Used

Bash

tar

Linux CLI tools

📌 Future Improvements

Incremental backups

Backup encryption

Cron job automation

Versioning system
