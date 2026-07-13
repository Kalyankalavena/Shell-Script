#!/bin/bash

echo "All variables passed to the script are stored in \$@ and \$* variables."
echo "Number of variables : \$#"
echo "Script name : \$0"
echo "Present working directory : \$PWD"
echo "Home directory : \$HOME"
echo "Which user is running this script : \$USER"
echo "Process id of current script : \$\$"
sleep 5 &
echo "Process id of last command executed : \$!"
