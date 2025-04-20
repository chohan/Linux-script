#############################################################################################################
#
# Desc: Daily check
# Auth: Salah Chohan
# Date: 12-Dec-2024
# Use:  daily_check.sh
#
#############################################################################################################

LOG_FILE=~/log/daily_check_$(date +%Y%W).log
SCRIPT_FOLDER=~/script


  # server boot time
  echo -e "\n\n\n\n\n####### boottime.py $(date "+%Y-%m-%d %H:%M:%S") starts #######" | tee -a ${LOG_FILE}
  $SCEIPT_FOLDER/boottime.sh | tee -a ${LOG_FILE} & # collect and inserts data in DB
  echo -e "####### bootime.sh $(date "+%Y-%m-%d %H:%M:%S") ends #######\n\n\n\n\n" | tee -a ${LOG_FILE}

  # memory status
  echo -e "\n\n\n\n\n####### memory.py $(date "+%Y-%m-%d %H:%M:%S") starts #######" | tee -a ${LOG_FILE}
  $SCEIPT_FOLDER/memory.sh | tee -a ${LOG_FILE} & # collect and inserts data in DB
  echo -e "####### memory.sh $(date "+%Y-%m-%d %H:%M:%S") ends #######\n\n\n\n\n" | tee -a ${LOG_FILE}

