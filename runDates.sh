################################################################################
#
# Desc:		Runs a query/command datewise, from START_DATE to END_DATE
# Author:	Salah Chohan
# Usage:	runDates.sh <from date> <to date>
#
################################################################################
#!/bin/bash

# parameters
START_DATE=$1		# yyyymmdd (optional), if missing, current=>current date
END_DATE=$2		# yyyymmdd (optional)

# pre-requisites
alias ssh='/usr/bin/ssh'
shopt -s expand_aliases
#set -x

# if start date not provided, START_DATE = current date
if [ -z "$START_DATE" ] ; then START_DATE=`date +%Y%m%d` ; fi

# if end date not provided, END_DATE = START_DATE
if [ -z "$END_DATE" ] ; then END_DATE=$START_DATE ; fi
END_DATE=$(date -d "$END_DATE + 1 day" +%Y%m%d)
echo $START_DATE, $END_DATE


# iterating thru dates
d=$START_DATE
#while [ "$d" != $END_DATE ]; do
until [ $d == $END_DATE ]; do
  echo -n "$d: "
  if [[ $(date -d $d +%u) -le 5 ]]; then	# ignore Saturday and Sunday
  
	echo "do something on weekday"

  else
	echo "enjoy weekend"
  fi
  d=$(date -d "$d + 1 day" +%Y%m%d)

done
