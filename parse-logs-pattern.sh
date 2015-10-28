!/bin/bash

# This script parse $logfile with $find_pattern

# logfile location
logfile="/tmp/test.log"

#
find_pattern="Unable to connect REST API"

#check file exist
if [ -f $logfile ];
then
   echo "File $logfile exists."
else
   echo "File $logfile does not exist."
fi

#find $find_pattern in $logfile
if grep -q $find_pattern $logfile;
 then
     echo "Succes! find pattern: '$find_pattern'"
     echo -e "$(grep $find_pattern $logfile)\n"
 else
     echo "Error! pattern '$find_pattern' was NOT Found in '$logfile'"
     echo "Exiting..."
     exit 0
fi
