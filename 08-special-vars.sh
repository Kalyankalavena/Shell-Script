#!/bin/bash

echo "All variables passed: $@"
echo "Number of variables: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "Process ID of current script: $$"
echo "proceess id of last command in background: $!"
sleep 60 &
echo "Exit status of last command executed: $?"
echo "Last argument of previous command: $_"
