# 🖥️ Linux Monitoring Tool

A real-time Linux system monitoring tool written in Bash.

This tool displays important system metrics such as CPU usage, RAM usage, Disk usage, Network information, User sessions, Running processes, and System logs.

---

## ✨ Features

### 📊 System Monitoring

- CPU Usage
- RAM Usage
- Disk Usage
- System Uptime
- Logged-in Users
- Top CPU-consuming Process

### 🚨 Alert System

- High CPU Usage Detection (>80%)
- High RAM Usage Detection (>80%)
- Colorized Status Indicators

### 🌐 Network Monitoring

- Hostname
- IP Address
- Internet Connectivity Check

### 📋 Log Monitoring

- Latest System Log
- Error Count (Last Hour)
- Latest Error Message
- System Log Health Status

### 🎨 User Interface

- Colorized Output
- Real-time Updates
- Auto Refresh Every 2 Seconds

---

## 📂 Project Structure

```text
monitoring_tool/
│
├── monitor.sh
├── README.md
```

---

## 🔧 Requirements

- Linux (Ubuntu/Debian recommended)
- Bash
- systemd (journalctl)
- Core Linux Utilities

Required commands:

```bash
top
free
df
hostname
ping
journalctl
ps
awk
grep
```

---

## 🚀 Installation

Clone the repository:

```bash
git clone <https://github.com/Narjes-Rezaei/Linux.git>
cd monitoring_tool
```

Make the script executable:

```bash
chmod +x monitor.sh
```

Run:

```bash
./monitor.sh
```

---

## 📸 Sample Output

```text
=============================
Linux System Monitoring Tool
=============================

CPU Usage: 12%
RAM Usage: 35%
Disk Usage: 71%

CPU Status: NORMAL
RAM Status: NORMAL

Hostname: linux-ubuntu
IP Address: 192.168.1.100
Internet: Online

Uptime: up 3 hours
Logged Users: 2
Top Process: chrome 12.4

Last Log:
Jun 08 14:20:01 systemd started service

Recent Errors: 0

System Log Status:
NO ERRORS
```

---

## 🛠 Technologies Used

- Bash Scripting
- Linux System Administration
- awk
- grep
- journalctl
- ps
- top
- free
- df
- ANSI Colors

---

## 📚 Concepts Learned

This project demonstrates:

- Bash Functions
- Variables
- Loops
- Conditional Statements
- Process Monitoring
- System Metrics Collection
- Log Analysis
- Network Monitoring
- Real-Time Terminal Dashboards


## 👨‍💻 Author

Developed as part of a Linux Administration and Bash Scripting learning roadmap.

