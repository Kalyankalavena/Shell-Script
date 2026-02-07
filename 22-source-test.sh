#!/bin/bash
source ./common.sh

SOURCE_DIR="/home/ec2-user/app-logs"
echo -e "\nScript execution completed. Logs can be found at: $LOG_FILE_NAME\n"

Files_To_Delete=$(find "$SOURCE_DIR" -name "*.log" -mtime +14)
echo "Files to be deleted:" &>>"$LOG_FILE_NAME"
echo "$Files_To_Delete" &>>"$LOG_FILE_NAME"

while read -r filepath
do
  rm -f "$filepath" &>>"$LOG_FILE_NAME"
  VALIDATE $? "Deleting file: $filepath"
done <<< "$Files_To_Delete"
