#!/bin/bash
#
#Display detailed information about Apache log
read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#____________________________________________________________________
function FindTheMostOccuringIP1() {
result=$(awk -F" " '{ print $1 }' "$1" | sort | uniq -c | sort -nr | head -n1)
echo "$result"
}


###########MAIN_HANDLE##############
string=$(FindTheMostOccuringIP1 $1)

ip=$(echo "$string" | cut -c 9-25)
number=$(echo "$string" | cut -c 6-7)
echo "The most occuring IP is $ip with numbers $number"
echo "________________________________________________"



