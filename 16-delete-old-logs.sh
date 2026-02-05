#!/bin/bash
echo -e "\nThis script demonstrates the use of colours in bash scripting\n"

USERID=$(id -u)

R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
NC="\e[0m"

SOURCE_DIR="/home/ec2-user/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo "$0" | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/${LOG_FILE}-${TIMESTAMP}.log"

VALIDATE() {
  if [ $1 -ne 0 ]
  then
    echo -e "$2 ... ${R}FAILURE${NC}"
    exit 1
  else
    echo -e "$2 ... ${G}SUCCESS${NC}"
  fi
}

# Create logs folder if not exists
mkdir -p "$LOGS_FOLDER"

echo "Script started executing at: $TIMESTAMP" &>>"$LOG_FILE_NAME"

if [ "$USERID" -ne 0 ]
then
  echo "ERROR:: You must have sudo access to execute this script"
  exit 1 #other than 
fi

for package in $@
do
    rpm -q "$package" &>>"$LOG_FILE_NAME"


    if [ $? -ne 0 ]
    then
        dnf install "$package" -y &>>"$LOG_FILE_NAME"
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already ... ${Y}INSTALLED${NC}"
    fi
    done
echo -e "\nScript execution completed. Logs can be found at: $LOG_FILE_NAME\n"

Files_To_Delete=$(find "$SOURCE_DIR" -name "*.log" -mtime +14)
echo "Files to be deleted:" &>>"$LOG_FILE_NAME"
echo "$Files_To_Delete" &>>"$LOG_FILE_NAME"

while 
do
  read -r filepath # here filepath is the variable name, you can give any name
  do
    rm -f "$file" &>>"$LOG_FILE_NAME"
    VALIDATE $? "Deleting file: $file"
  done <<< "$Files_To_Delete"