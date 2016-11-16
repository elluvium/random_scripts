#
#Detecting OS
#
#___________________________________________________________________
read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#___________________________________________________________________

echo "Do you know the type of your OS?"; read first_answer;
case "$first_answer" in
	"No" | "no" | "n" | "N")
           echo ""
	   echo "Do you want to know your OS type?"; read second_answer;
		case "$second_answer" in
		"No" | "no" | "n" | "N")
			exit;;
		"yes" | "Yes" | "y" | "Y")
			OS=$(lsb_release -sd); OS_str=$(uname -a);
			echo "Distributive: $OS"; echo "Kernel version: $OS_str" ;;
	        esac ;;

	"yes" | "Yes" | "Y" | "y")
		OS=$(lsb_release -sd); OS_str=$(uname -a);

		echo "Type it" ; read user_variant;

		if echo "$OS_str" | grep -qi "$user_variant"
                then
			echo "You're right! You have a $OS";
		else
			echo "You're wrong! You have a $OS"
		fi
esac


