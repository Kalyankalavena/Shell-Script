#!/bin/bash

USERID=$(id -u) 

VALIDATE(){

if [ $1 -ne 0 ]
then
      echo "$2 failed "
      exit 1
    else
      echo "$2 is successful."
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
    VALIDATE $1  installation of mysql

else
      echo "installing mysql is ALREADY INSTALLED."
fi
else
    echo "mysql is already installed."
fi

dnf list installed git

if [ $? -ne 0 ]; 
then # not installed
    dnf install git -y
    VALIDATE $1  installation of git

else
      echo "installing git is ALREADY INSTALLED."
fi
else
    echo "git is already installed."
fi