#!/bin/bash

# How-to use:
# sh parse-log-recursive.sh <path to folder> <find pattern string> <result search file> 

# Variables from args
folder=$1
pattern=$2
result=$3

touch $result

# check folder exist, readable 
if [ -d "$folder" -a -r "$folder" ]
then
   echo "Folder for search - $folder exists and readable."
   echo "Writting..."
   grep -Rn "$pattern" $folder > $result
   if [ -s "$result" ]
	then
		echo "Write end."
	else
		echo "Error! file is zero"
	fi
else
   echo "Folder for search $folder does not exist or not readable."
fi