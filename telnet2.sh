#!/usr/bin/bash
# to telnet and kill it after sometime
# usage: telnet2 10.10.10.10 1000 10

echo $#   # No of parameters
if [ "$#" -ne 4 ]; then
/usr/bin/telnet $1 $2 &
else
/usr/bin/telnet -b $4 $1 $2
fi
sleep $3
pids=`ps -efa|grep /usr/bin/telnet | egrep -v "UID|USER"|awk '{print $2}'|sed 's/^[ \t}*//;s/[ \t]*$//'`
echo "PIDs = $pids"
if [[ ! -z $pids ]]; then
  for pid in "$pids"; do
    kill -9 $pid &2> /dev/null
  done
fi
