#
#Display detailed information about Apache logs
#

#!/bin/bash
read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#____________________________________________________________________

PATH_TO_LOG=$1;

if [ -f $PATH_TO_LOG ]; then
    echo 


else
    echo "File does not exist"; exit

