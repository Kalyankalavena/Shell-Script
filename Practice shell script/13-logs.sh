#!/bin/bash

USERID=$(id -u) 

R="\e[1;31m" # Red
G="\e[1;32m" # Green
Y="\e[1;33m" # Yellow]"

LOGS_FOLDER="/var/log/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE_NAME="LOGS_FOLDER/LOGS_FILE-$TIMESTAMP.log"

VALIDATE(){

if [ $1 -ne 0 ]
then
      echo -e "$R $2 .... ${R}failed "
      exit 1
else 
  echo -e "$G $2 .... ${G}successful "
    fi
}

echo " script execution started at: $LOG_FILE_NAME" >> $LOG_FILE_NAME

if [ $USERID -ne 0 ]
then # not installed
    echo "Error :: This script must be run as root. Please run with sudo or as root user."
    exit 1 # other than 0 exit status indicates error
fi

dnf list installed mysql &> $LOG_FILE_NAME

if [ $? -ne 0 ]; 
then # not installed
    dnf install mysql -y &>> $LOG_FILE_NAME
    VALIDATE $? "installation of mysql"

else
      echo -e "$Y installing mysql is ALREADY INSTALLED. ${Y}"
fi

dnf list installed git &>> $LOG_FILE_NAME

if [ $? -ne 0 ]; 
then # not installed
    dnf install git -y &>> $LOG_FILE_NAME
    VALIDATE $? "installation of git"

else
      echo -e "$Y installing git is ALREADY INSTALLED. ${Y}"

fi
