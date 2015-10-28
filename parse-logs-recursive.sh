# How-to use:
# sh parse-log-recursive.sh <path to folder> <find pattern string> <result search file> 

!/bin/bash

# Variables from args
$folder=$1
$pattern=$2
$result=$3


#check folder exist, readable 
if test -f $folder -a -r $folder
then
   echo "Folder for search - $folder exists and readable."
   exit 1
else
   echo "Folder for search $folder does not exist or not readable."
fi


if test -f $folder -a -r $folder
then
   echo "Write search result to $result"
   grep -Rn "$pattern" $result
   exit 0
else
   echo "Folder for write result file $result does not exist or not readable."
   exit 1
fi