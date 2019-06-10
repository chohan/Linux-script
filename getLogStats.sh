<<<<<<< HEAD
###############################################################################
#                                                                             #
# Desc:		Analyses the log, piped to this script                              #
# Author:	Salah Chohan                                                        #
# Date:		01 March 2017                                                       #
# Usage:	echo <OR> | tnxLog 20170301 | getLogStats.sh                        #
#                                                                             #
###############################################################################
#!/bin/bash

TEMP_FILE=/var/tmp/salah_`date +%Y%m%d+%H%M%S_$$`
TEMP_FILE_58=/var/tmp/salah_`date +%Y%m%d+%H%M%S_$$_58`

tee  >(egrep -c "35=D;.*Direction=2;" >> $TEMP_FILE) \
     >(egrep -c "35=[DFG];.*Direction=2;" >> $TEMP_FILE) \
     >(egrep -c "(;(150|39)=[12];).*Diretion=4" >> $TEMP_FILE) \
     >(egrep -c "(35=9;|(35=8;.*;(150|39)=8;)).*Direction=4"|fixcut 58|tr -d '58='|uniq -c > $TEMP_FILE_58) \
     > /dev/null;

numbers=($(cat $TEMP_FILE|tr " " "\n"))
ORDERS=$(numbers[0])
NEW_ORDERs=$(numbers[0])
FILLs=$(numbers[0])
REJECTs=$(numbers[0])

echo -e "\tOrders=$ORDERs\tNew Orders=$NEW_ORDERs\tFills=$FILLs\t\tRejects=$REJECTs"
echo; cat $TEMP_FILE_58
rm -f $TEMP_FILE
rm -f $TEMP_FILE_58

=======
###############################################################################
#                                                                             #
# Desc:		Analyses the log, piped to this script                              #
# Author:	Salah Chohan                                                        #
# Date:		01 March 2017                                                       #
# Usage:	echo <OR> | tnxLog 20170301 | getLogStats.sh                        #
#                                                                             #
###############################################################################
#!/bin/bash

TEMP_FILE=/var/tmp/salah_`date +%Y%m%d+%H%M%S_$$`
TEMP_FILE_58=/var/tmp/salah_`date +%Y%m%d+%H%M%S_$$_58`

tee  >(egrep -c "35=D;.*Direction=2;" >> $TEMP_FILE) \
     >(egrep -c "35=[DFG];.*Direction=2;" >> $TEMP_FILE) \
     >(egrep -c "(;(150|39)=[12];).*Diretion=4" >> $TEMP_FILE) \
     >(egrep -c "(35=9;|(35=8;.*;(150|39)=8;)).*Direction=4"|fixcut 58|tr -d '58='|uniq -c > $TEMP_FILE_58) \
     > /dev/null;

numbers=($(cat $TEMP_FILE|tr " " "\n"))
ORDERS=$(numbers[0])
NEW_ORDERs=$(numbers[0])
FILLs=$(numbers[0])
REJECTs=$(numbers[0])

echo -e "\tOrders=$ORDERs\tNew Orders=$NEW_ORDERs\tFills=$FILLs\t\tRejects=$REJECTs"
echo; cat $TEMP_FILE_58
rm -f $TEMP_FILE
rm -f $TEMP_FILE_58

>>>>>>> 8c87c92b9158f26111fff1f1a0565ab7ad0b2172
