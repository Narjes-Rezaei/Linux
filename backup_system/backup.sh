#!/bin/bash
#
#############################
# Linux Backup System
#############################
#
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
NC="\e[0m"

LOG="Backup_log.log"
BACKUP_DIR="Backups"
SOURCE_DIR="/home/linux-ubuntu/Downloads/project_1"
MAX_BACKUPS=5
#=============================
# Help
# ============================
show_help(){
  echo -e "${YELLOW}Linux Backup Utility${NC}"
  echo ""
  echo "Usage:"
  echo "   ./backup.sh --backup"
  echo "   ./backup.sh --restore"
  echo "   ./backup.sh --list"
  echo "   ./backup.sh --help"
  echo ""
}

#============================
# List
# ===========================
list_backups(){
  echo -e "${YELLOW}Available Backups:${NC}"
  ls -1 "$BACKUP_DIR"/Backup_*.tar.gz 2>/dev/null || echo "No backups found."
}

#=============================
# Backup
# ============================
create_backup(){
  DATE=$(date +"%Y-%m-%d_%H-%M-%S")
  BACKUP_FILE="$BACKUP_DIR/Backup_$DATE.tar.gz"

  if [[ ! -d "$SOURCE_DIR" ]]; then
    echo -e "${RED}(date) - ERROR: Source directory does not exist!" >> "$LOG"
    echo -e "${RED}Source directory not found!"
    exit 1
  fi

  mkdir -p "$BACKUP_DIR"

  echo -ne "${YELLOW}Backup"
  for i in {1..4}; do
    echo -n "."
    sleep 0.5
  done

  echo -e "${NC}\n"

  PARENT_DIR=$(dirname "$SOURCE_DIR")
  BASE_DIR=$(basename "$SOURCE_DIR")

  tar -czf "$BACKUP_FILE" -C "$PARENT_DIR" "$BASE_DIR"

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Backup created successfully✔: $BACKUP_FILE"
    echo -e "$(date) - Backup created: $BACKUP_FILE${NC}" >> $LOG
  else
    echo -e "${RED}Backup failed!"
    echo "$(date) - Backup FAILED" >> $LOG
  fi

  #=================================
  # Remove old backups (keep only last 5)
  # ================================
  BACKUP_COUNT=$(ls -1 $BACKUP_DIR/Backup_*.tar.gz 2>/dev/null | wc -l)

  if [ "$BACKUP_COUNT" -gt "$MAX_BACKUPS" ]; then
     echo "$(date) - Deleting old backups..." >> "$LOG"
     ls -1t "$BACKUP_DIR"/Backup_*.tar.gz | tail -n +$((MAX_BACKUPS+1)) | while read file; 
  do
     rm -f "$file"
     echo "$(date) - Deleted: $file" >> "$LOG"
  done
  fi
}

#==============================
# Restore
# =============================
restore_backup(){

  list_backups
  echo ""
  read -p "Enter backup file name: " FILE

  if [ ! -f "$BACKUP_DIR/$FILE" ]; then
    echo -e "${RED}File not found!${NC}"
    exit 1
  fi

  echo -ne "${YELLOW}Restoring"
  for i in {1..4}; do
    echo -n "."
    sleep 0.5
  done
  echo -e "${NC}"

  tar -xzf "$BACKUP_DIR/$FILE" -C "$(dirname "$SOURCE_DIR")"

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}Restore completed ✔${NC}"
    echo "$(date) - Restore completed: $FILE" >> "$LOG"
  else
    echo -e "${RED}Restore FAILED ❌${NC}"
    exit 1
  fi
}

#===========================
# Menu
# ==========================
show_menu(){
  echo ""
  echo "1) Backup"
  echo "2) Restore"
  echo "3) List"
  echo "4) Help"
  echo "5) Exit"
  echo ""
  read -p "Choose an option: " choice

  case $choice in
    1) create_backup ;;
    2) restore_backup ;;
    3) list_backups ;; 
    4) show_help;;
    5) exit 0 ;;
    *) echo "Invalid option" ;;
  esac
}
#========================
# Argument Handling
# =======================
case "$1" in
  --backup) create_backup ;;
  --restore) restore_backup ;;
  --list) list_backups ;;
  --help) show_help ;;
  "") show_menu ;;
  *) echo "Invalid option. Use --help" ;;
esac



