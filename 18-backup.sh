#!/bin/bash


R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
NC="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # IF USER DOES NOT PROVIDE DAYS, DEFAULT TO 14

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo "$0" | awk -F "/" '{print $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/${LOG_FILE}-${TIMESTAMP}.log"

 usage() {
  echo -e "$R usage::$N sh 18-backup.sh <source_directory> <destination_directory> <days (optional)>"
  exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/
echo "Filename: $0" 

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]
then
     echo -e "$SOURCE_DIR does not exist. please check."
     exit 1
fi

if [ ! -d "$DEST_DIR" ]
then  
    echo -e "$DEST_DIR does not exist. please check."
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>"$LOG_FILE_NAME"

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +"$DAYS")

if [ -n "$FILES" ] # true if there are files to zip
then 
  echo "Files are : $FILES"
  ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
  find $SOURCE_DIR -name "*.log" -mtime +"$DAYS" | zip -@ "$ZIP_FILE"
  if [ -f "$ZIP_FILE" ]
  then
    echo -e "succesfully created zip files for files older than $DAYS"
    while read -r filepath # here filepath is the variable name, you can give any name
    do
      echo "Deleting file: $filepath" &>>"$LOG_FILE_NAME"
      rm -f "$filepath" &>>"$LOG_FILE_NAME"
      VALIDATE $? "Deleting file: $filepath"
  done <<< "$FILES"
else
    echo -e "${R}ERROR:${NC} Failed to create backup zip file."
    exit 1
  fi

else
  echo "no files found older than $DAYS"
fi

