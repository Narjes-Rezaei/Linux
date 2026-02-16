#!/bin/bash

# ========================================
# File Management Script
# ========================================


# list all files
echo "list of files:" > file_list.txt
ls *.txt >> file_list.txt


# combine contents of all files into one
cat *.txt > all_files.txt


# find files with more than 10 lines
echo "files more than 10 lines:" > big_files.txt
for f in *.txt; do
  LINES=$(wc -l < "$f")
  if [ "$LINES" -gt 10 ]; then
    echo "$f ($LINES lines)" >> big_files.txt
  fi
done

echo "Script executed successfully!"
