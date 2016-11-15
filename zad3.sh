#
#BACKUP ALL FILES IN THE SPECIFIED FOLDER
#

#!/bin/bash
read -n 1 -p "Are you sure to run this script? (y/[a]): " AREYOUSURE;
[ "$AREYOUSURE" = "y" ] || exit;
echo "" #for next line
#____________________________________________________________________

PATH_TO_DIRECTORY=$1
BACKUP_PATH=$2
LOG_FILE="/home/student/scripts/logs/zad3.log"
CP_ONLY_FILES="/"
DATE=$(date +%Y-%m-%d-%H:%M:%S)

function Start_Backup() {
  echo "Directory $1 backup started in $DATE .." >> $LOG_FILE
  rsync -a "$PATH_TO_DIRECTORY$CP_ONLY_FILES" "$BACKUP_PATH$CP_ONLY_FILES";  
  if [ $? == 0 ]; then
      echo "Backup for directory $1 finished successfully in $DATE" >> $LOG_FILE
  else
      echo "Backup for directory $1 finished UNSUCCESSFUL in $DATE " >> $LOG_FILE
  fi
  echo "________________________________________________________" >> $LOG_FILE
}

Start_Backup



