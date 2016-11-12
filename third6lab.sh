#
#Detecting OS
#
#___________________________________________________________________
read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#___________________________________________________________________
echo "Do you know the type of your OS?"; read first_answer;
case $first_answer in
	'No')
	   echo "Do you want to know your OS type?"; read second_answer;
		


OS_VER=$(lsb_release -sd)
echo $OS_VER


