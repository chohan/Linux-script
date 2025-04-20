#############################################################################################################
#
# Desc: drives some scheduled jobs
# Auth: Salah Chohan
# Date: 20-Nov-2024
# Use:  nohup <path to file>/cron_drives.sh &> ~/log/cron_driver_$(date +%Y%W).log &
#
#############################################################################################################

LOG_FILE=~/log/cron_driver_$(date +%Y%W).log
SCRIPT_FOLDER=<path to file>/script

while true;
do
  #echo -e "\n\nCalling cron_jobs.sh" >> $LOG_FILE
  #~/script/cron_jobs.sh &
  #echo "Sleeping for some time." >> $LOG_FILE
  #sleep 10

  DAY=$(date +%u)
  DAY_TIME=$(date +%u-%H%M)

  # Saturday check
  if [ $DAY -eq 6 ]; then
    echo "This is saturday. Don't anything" &
    #sleep 60
    #continue
  fi


  # Sunday 10am check
  #if [ $(DAY_TIME) -eq "0-0900" ]; then
    #~/script/servers_boot_time.py &
  #fi
  if [[ ${DAY_TIME} == "0-1000" ]]; then
    #sleep 60
    #continue
    echo ""
  fi

  # Monday 6am check
  if [[ ${DAY_TIME} == "1-0600" ]]; then

    # login to various portals and all Linux servers
    echo -e "\n\n\n\n\n####### login.sh $(date "+%Y-%m-%d %H:%M:%S") starts #######" | tee -a ${LOG_FILE}
    $SCEIPT_FOLDER/login.sh | tee -a ${LOG_FILE} & # collect and inserts data in DB
    echo -e "####### login.sh $(date "+%Y-%m-%d %H:%M:%S") ends #######\n\n\n\n\n" | tee -a ${LOG_FILE}
  fi 


  TIME=$$(date +%H%M)
  #echo $TIME

  # Daily 7am check
  if [[ "0700" == "$TIME" ]]; then
    echo -e "\n\n\n\n\n####### Good Morning email $(date "+%Y=%m=%d %H:%M:%S") starts #######" | tee -a ${LOG_FILE}
    echo "Crontab is being emulated on $(hostname)" | /usr/bin/mailx -S ssl-verify=ignore -S smtp="smtp3dns.bankofamerica.com" -s "Good Morning Salah" -a ~/.bashrc salah.chohan@bofa.com
    echo -e "####### Good morning email $(date "+%Y-%m-%d %H:%M:%S") ends #######\n\n\n\n\n" | tee -a ${LOG_FILE}
  fi

  # Daily 8am check
  if [[ "0800" == "$TIME" ]]; then

    echo -e "\n\n\n\n\n####### daily_check.sh $(date "+%Y-%m-%d %H:%M:%S") starts #######" | tee -a ${LOG_FILE}
    $SCEIPT_FOLDER/daily_check.sh
    echo -e "####### daily_check.sh $(date "+%Y-%m-%d %H:%M:%S") ends #######\n\n\n\n\n" | tee -a ${LOG_FILE}
  fi



  if [[ "1354" == "$TIME" ]]; then
    echo "this is 13hours"
  if

  sleep 60

done
