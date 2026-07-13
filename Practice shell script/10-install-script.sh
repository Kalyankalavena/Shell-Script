#!/bin/bash

USERID=$(id -u) 

if [ $USERID -ne 0 ]; then
   echo "Error :: This script must be run as root. Please run with sudo or as root user."
fi

dnf install mysql -y
