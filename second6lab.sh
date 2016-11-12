#
#Counting symbols in Readme.txt file and write it to text file
#

read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line

echo "Current directory: $PWD" >> aboutReadme.txt 
SYMBOLS_COUNT=$(cat ~/scripts/my_scripts/readme.txt | wc -l)
echo "File Readme.txt has $SYMBOLS_COUNT symbols" >> aboutReadme.txt;
echo "Text succesfully was written!"

