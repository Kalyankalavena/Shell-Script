#!/bin/bash

USERID=$(id -u) 

R="\e[1;31m" # Red
G="\e[1;32m" # Green
Y="\e[1;33m" # Yellow]"

VALIDATE(){

if [ $1 -ne 0 ]
then
      echo -e "$R $2 .... ${R}failed "
      exit 1
else 
  echo -e "$G $2 .... ${G}successful "
    fi
}

if [ $USERID -ne 0 ]
then # not installed
    echo "Error :: This script must be run as root. Please run with sudo or as root user."
    exit 1 # other than 0 exit status indicates error
fi

dnf list installed mysql

if [ $? -ne 0 ]; 
then # not installed
    dnf install mysql -y
    VALIDATE $? "installation of mysql"

else
      echo -e "$Y installing mysql is ALREADY INSTALLED. ${Y}"
fi

dnf list installed git

if [ $? -ne 0 ]; 
then # not installed
    dnf install git -y
    VALIDATE $? "installation of git"

else
      echo -e "$Y installing git is ALREADY INSTALLED. ${Y}"

fi
