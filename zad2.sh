#
#NMAP scanner
#

#!/bin/bash
read -n 1 -p "Are you sure to run this script? (y/[n]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#____________________________________________________________________
#MAIN HANDLE

if [ "$1" == "--all" ]; then
    SUBNET_IP=$(hostname -I)
    
elif [[ $1 =~ "--target="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]; then
    IP=$(echo "$1" | cut -c 10-)
    nmap -Pn "*" $IP;
else
    echo "OPTIONS SUMMARY"
    echo "          You can use next 2 options: "
    echo "      --all  -   Shows you all IP-addresses and symbolic names of all nodes in the current subnet"
    echo ""
    echo "      --target=X.X.X.X  -  Shows you a list of open system ports TCP"
fi
