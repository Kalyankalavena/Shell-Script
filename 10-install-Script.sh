#!/bin/bash

USERID=$(id -u)

# Root check
if [ "$USERID" -ne 0 ]; then
  echo "ERROR:: You must have sudo access to execute this script"
  exit 1
fi


dnf list installed mysql

if [ $? -ne 0 ]; then
  echo "MySQL not found. Installing..."
  dnf install mysql -y

  if [ $? -ne 0 ]; then
    echo "Installing MySQL ..... FAILED"
    exit 1
  else
    echo "Installing MySQL ..... SUCCESS"
  fi
else
  echo "MySQL is already installed"
fi

dnf list installed git 

if [ $? -ne 0 ]; then
  echo "Git not found. Installing..."
  dnf install git -y

  if [ $? -ne 0 ]; then
    echo "Installing Git ..... FAILED"
    exit 1
  else
    echo "Installing Git ..... SUCCESS"
  fi
else
  echo "Git is already installed"
fi
