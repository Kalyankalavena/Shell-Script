#!/bin/bash

MSG="SCRIPT1"
GREET="HI from Script1"
SOURCE ./21-script-2.sh # this will execute the script and export the variables to current shell environment

echo "Hello from : $MSG"

#sh 21-script-2.sh