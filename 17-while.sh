#!/bin/bash

while read -r line
do
    echo "$line"
done < 16-delete-old-logs.sh
# The above code reads each line from the file '16-delete-old-logs.sh' and prints it to the console.