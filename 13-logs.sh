#!/bin/bash

echo -e "\nThis script demonstrates the use of colours in bash scripting\n"

USERID=$(id -u)

R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
NC="\e[0m"

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
  exit 1
fi

dnf list installed mysql &>>"$LOG_FILE_NAME" || true

if [ $? -ne 0 ]
then
  dnf install mysql -y &>>"$LOG_FILE_NAME"
  VALIDATE $? "Installing MySQL"
else
  echo -e "MySQL is already ... ${Y}INSTALLED${NC}"
fi

dnf list installed git &>>"$LOG_FILE_NAME" || true

if [ $? -ne 0 ]
then
  dnf install git -y &>>"$LOG_FILE_NAME"
  VALIDATE $? "Installing Git"
else
  echo -e "Git is already ... ${Y}INSTALLED${NC}"
fi
