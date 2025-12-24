#!/bin/bash

NUMBER=$1

# -gt : greater than,-lt : less than, -eq : equal to, -ne : not equal to,-ge : greater than or equal to, -le : less than or equal to
if [ $NUMBER -gt 100 ]
then
echo "given number is greater than 100"
 else 
    echo "given number is less than or equal to 100"