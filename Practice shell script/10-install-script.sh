#!/bin/bash

USERID=$(id -u) 

if [ $USERID -ne 0 ]; then
   echo "Error :: This script must be run as root. Please run with sudo or as root user."
   exit 1 # other than 0 exit status indicates error
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
   echo "installation of mysql failed "
   exit 1
if
else
    echo "installing mysql is successful."


dnf install git -y
if [ $? -ne 0 ]; then
   echo "installation of git failed"

   exit 1   
if
else
    echo "installing git is successful."

dnf install httpd -y
if [ $? -ne 0 ]; then
   echo "installation of httpd failed."
   exit 1   
if
else
    echo "installing httpd is successful."