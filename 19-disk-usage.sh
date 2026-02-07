#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects will monitor for 70 

while read -r line
doz 
    USAGE=$(echo $line | awk -F " " '{print $6F}')
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    echo "partition: $PARTITION, usage: $USAGE"

done <<< "$DISK_USAGE



