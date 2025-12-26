#!/bin/bash

echo -e "\nThis script demonstrates the use of colours in bash scripting\n" 

USERID=$(id -u)
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
B="\e[0;34m"
M="\e[0;35m"
C="\e[0;36m"
W="\e[0;37m"
NC="\e[0m" # No Color
LOGS_FOLDER="/var/log/shellscript-logs" 
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/${LOG_FILE}-${TIMESTAMP}.log"  


VALIDATE() {
  if [ $1 -ne 0 ]
  then
    echo -e "$2..... $R FAILURE"
    exit 1
  else
    echo -e "$2..... $G SUCCESS"
  fi
}
echo "script started at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ "$USERID" -ne 0 ]; then
  echo "ERROR:: You must have sudo access to execute this script"
  exit 1 #other than 0
fi
dnf list installed mysql &>>$LOG_FILE_NAME || true

if [ $? -ne 0 ]
then # not installed
   dnf install mysql -y &>>$LOG_FILE_NAME
   VALIDATE $? "INSTALLING MYSQL"
else
    echo -e "MYSQL is already $Yinstalled"${NC} 
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
   dnf install git -y &>>$LOG_FILE_NAME
   VALIDATE $? "INSTALLING GIT"
else
    echo -e "GIT is already $Yinstalled"${NC} 
fi


