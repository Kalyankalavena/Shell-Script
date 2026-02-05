#!/bin/bash


R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
NC="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # IF USER DOES NOT PROVIDE DAYS, DEFAULT TO 14

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo "$0" | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/${LOG_FILE}-${TIMESTAMP}.log"

VALIDATE() {
  if [ $1 -ne 0 ]
  then
    echo -e "$2 ... ${R}FAILURE${NC}"
    exit 1
  else
    echo -e "$2 ... ${G}SUCCESS${NC}"
  fi
}
 usage() {
  echo -e "\nUsage: $0 <source_directory> <destination_directory> <days[optional]>\n"
  echo "  source_directory      Directory to back up"
  echo "  destination_directory Directory where the backup will be stored"
  echo "  days                  Number of days to retain backups (default: 14)"
  exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then
  usage
fi

if [ ! -d "$SOURCE_DIR" ]
then
  echo -e "${R}ERROR:${NC} Source directory '$SOURCE_DIR' does not exist. please check."
  exit 1
fi
if [ ! -d "$DEST_DIR" ]
then  
  echo -e "${R}ERROR:${NC} Destination directory '$DEST_DIR' does not exist. please check."
  exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>"$LOG_FILE_NAME"

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +"$DAYS")

if [ -n "$FILES" ]
then 
  echo "Files are : $FILES"
else
  echo "no files found older than $DAYS"
fi

