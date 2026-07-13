#!/bin/bash

USERID=$(id -u) 

if [ $USERID -ne 0 ]; then
   echo "Error :: This script must be run as root. Please run with sudo or as root user."
   exit 1 # other than 0 exit status indicates error
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
   echo "installation of mysql failed. Please check the logs."
   exit 1
fi
else
    echo "installing mysql is successful."


dnf install git -y
if [ $? -ne 0 ]; then
   echo "installation of git failed. Please check the logs."
   exit 1   
fi
else
    echo "installing git is successful."

dnf install httpd -y
if [ $? -ne 0 ]; then
   echo "installation of httpd failed. Please check the logs."
   exit 1   
fi
else
    echo "installing httpd is successful."