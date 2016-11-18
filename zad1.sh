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

function FindTheMostOccuringPage2() {
result=$(awk -F" " '{ print $7 }' "$1" | sort | uniq -c | sort -nr | head -n1)
echo "$result"
}

function CountRequestsNumber3() {
result=$(awk -F" " '{ print $1 }' "$1" | sort | uniq -c | sort -nr)
echo "$result"
}

function RequestToNonExistPages4() {
result=$(awk -F" " '{ if($9 =="404") print $7" "$8" "$9;}' "$1")
if [ "$result" == "" ]; then
echo "Non existing pages does not exsist in current log"
else
echo "$result"
fi
}

function LetsFindSomeBotsss() {
result=$(awk -F" " '/bot/ || /Bot/ { print $14 }' "$1" | sort | uniq -c)
echo "$result"
}


###########MAIN_HANDLE##############
echo "________________________________________________"
string1=$(FindTheMostOccuringIP1 $1) #first task
ip=$(echo "$string1" | cut -c 9-25)
number1=$(echo "$string1" | cut -c 6-7)
echo "The most occuring IP is $ip with numbers $number1"
echo "________________________________________________"

string2=$(FindTheMostOccuringPage2 $1) #second task
page=$(echo "$string2" | cut -c 9-25)
number2=$(echo "$string2" | cut -c 6-7)
echo "The most requested page is $page with numbers $number2"
echo "________________________________________________"

string3=$(CountRequestsNumber3 $1) #third task
echo "$string3"
echo "________________________________________________"

string4=$(RequestToNonExistPages4 $1) #4 task
echo "$string4"
echo "________________________________________________"

string6=$(LetsFindSomeBotsss $1) #6 task
echo "$string6"
echo "________________________________________________"
