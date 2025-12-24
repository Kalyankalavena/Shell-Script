#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; 
then
  echo "ERROR:: You must have sudo access to execute this script"
  exit 1 #other than 0

  fi

dnf install mysql -y

if [ $? -ne 0 ]

then
  echo "installing mysql .....FAILED" 
  exit 1
else
  echo "installing mysql .....SUCCESS"
  fi

dnf install git -y
if [ $? -ne 0 ]

then
  echo "installing git .....FAILED" 
  exit 1
else
  echo "installing git .....SUCCESS"
  fi



