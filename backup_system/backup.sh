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

echo -ne "${YELLOW}Backup"
for i in {1..4}; do
  echo -n "."
  sleep 0.5
done

echo -e "${NC}\n"


LOG="Backup_log.log"
BACKUP_DIR="Backups"
SOURCE_DIR="/home/linux-ubuntu/Downloads/project_1"
MAX_BACKUPS=5
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo -e "${RED}(date) - ERROR: Source directory does not exist!" >> "$LOG"
  echo -e "${RED}Source directory not found!"
  exit 1
fi

mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/Backup_$DATE.tar.gz"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR" &>/dev/null

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

