#
#Login as users to remote machine and display some information about users
#login history
#

#!/bin/bash
read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#____________________________________________________________________
echo "Login as \"elu..."
ssh elu@192.168.43.37 'exit'
echo "Login  sucessfull."

echo "Login as \"amnesiac..."

echo " HERE IS LAST LOGIN INFORMATION ABOUT USERS: "
echo ""
ssh amnesiac@192.168.43.37 last | awk -F" " '{ print $1" "$4" "$5" "$6" "$7" "$8" "$9" "$10" "$11 }' | awk '!/^reboot/'
echo "Sucessfully finished!"

exit 0






