#!/bin/bash
#
#
#
#############################
# Linux Monitoring Tool
# ###########################
#
#
#
GREEN="\e[32m"
YELLOW="\e[33m"
WHITE="\e[37m"
NC="\e[0m"
#
#
#

while true
do


  if [[ "$FIRST_RUN" = false ]]; then
    printf "\033[18A"
  fi

  CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
  RAM=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
  DISK=$(df -h / | grep -o '[0-9]\+%')
  IP=$(hostname -I | awk '{print $1}')
  HOST=$(hostname)

  CPU_INT=${CPU%.*}
  RAM_INT=${RAM%.*}

  if [ "$CPU_INT" -gt 80 ]; then
     CPU_STATUS="${RED}HIGH CPU USAGE! 🚨${NC}"
  else
     CPU_STATUS="${GREEN}NORMAL${NC}"
  fi

  if [ "$RAM_INT" -gt 80 ]; then
     RAM_STATUS="${RED}HIGH RAM USAGE! 🚨${NC}"
  else
     RAM_STATUS="${GREEN}NORMAL${NC}"
  fi

  printf "\033[J"

  echo "============================="
  echo "Linux Syetem Monitoring Tool "
  echo "============================="
  printf "\n"


  echo -e "${GREEN}CPU Usage:${NC} $CPU%"
  echo -e "${GREEN}RAM Usage:${NC} $RAM%"
  echo -e "${GREEN}Disk Usage:${NC} $DISK"

  printf "\n"
  echo -e "${GREEN}CPU Status:${NC} $CPU_STATUS"
  echo -e "${GREEN}RAM Status:${NC} $RAM_STATUS"
  printf "\n"

############ Network ################
  echo -e "${YELLOW}Hostname:${NC} $HOST"
  echo -e "${YELLOW}IP Address:${NC} $IP"
  if ping -c 1 8.8.8.8 &>/dev/null; 
  then
    INTERNET="${GREEN}Online${NC}"
  else
    INTERNET="${RED}Offline${NC}"
  fi
  echo -e "${GREEN}Internet:${NC} $INTERNET"
  printf "\n"
#####################################
#
  UPTIME=$(uptime -p)
  echo -e "${GREEN}Uptime:${NC} $UPTIME"

  USERS=$(who | wc -l)
  echo -e "${GREEN}Logged Users:${NC} $USERS"

  TOP_PROCESS=$(ps -eo comm,%cpu --sort=-%cpu | head -2 | tail -1)
  echo -e "${GREEN}Top Process:${NC} $TOP_PROCESS"

  FIRST_RUN=false

  sleep 2
done


