#!/bin/bash

USERID=$(id -u)

VALIDATE() {
  if [ $1 -ne 0 ]; then
    echo "$2 ..... FAILURE"
    exit 1
  else
    echo "$2 ..... SUCCESS"
  fi
}

if [ "$USERID" -ne 0 ]; then
  echo "ERROR:: You must have sudo access to execute this script"
  exit 1
fi

# Check and install MySQL
dnf list installed mysql &>/dev/null
if [ $? -ne 0 ]; then
  dnf install mysql -y
  VALIDATE $? "INSTALLING MYSQL"
else
  echo "MYSQL is already installed"
fi

# Check and install Git
dnf list installed git &>/dev/null
if [ $? -ne 0 ]; then
  dnf install git -y
  VALIDATE $? "INSTALLING GIT"
else
  echo "GIT is already installed"
fi
