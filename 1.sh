#!/bin/bash

LOGFILE=/home/student/scripts/logs/log.txt

read -n 1 -p "Are you sure to run this script (y/[a]): " AMSURE
[ "$AMSURE" = "y" ] || exit
echo "";

echo "Packing $1 and logging to $2" > $2;
echo "+++++++++++++start++++++++++" > $2;
tar -zcvf "${1##*/}.tar.gz" $1 >> $2;

