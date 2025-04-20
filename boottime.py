#!/usr/bin/python
#############################################################################################################
#
# Desc: finds boot time of prod servers
# Auth: Salah Chohan
# Date: 08-Nov-2024
# Use:  boottime.py
# Pre-requisite: Util.py
#
#############################################################################################################
import os, sys, inspect, subprocess, pipes, getpass #import Popen, PIPE
import time
from datetime import datetime, timedelta
import util as U
#sys.path.append(r'/fxtnas/scratch/salah/python/site-packages/prettytable-3.3.0/src/prettytable')
#from prettytable import PrettyTable

Email = "Salah.Chohan@bofa.com"
#Email = ''
cmd=' \'STS=$(cat /proc/uptime|cut -d" " -f1); hr=$(bc <<< $STS/3600); boot_time=$(uptime -s); echo "$boot_time ${hr}" \' '



def find_boot_time(env, servers):
  U.dbOpen()
  U.dbDelete("delete from boottime where Env='" + env + "'")

  #table = PrettyTable(["Server", "Boot Date", "Boot Time", "Boot Life"])
  #table.align["Boot Life"] = 'r'

  insert_str = """INSERT INTO boottime
                  (date, time, Env, Server, Boot_date, Boot_time, Life)
                  VALUES(?, ?, ?, ?, ?, ?, ?)"""
  DT = datetime.now().strftime("%Y%m%d")
  MT = datetime.now().strftime("%H%M%S")

  for server in servers:
    print("\n\n\n##### " + server + " #####")
    COMMAND = U.SSH_COMMAND + server + cmd
    res = None
    try:
      p = subprocess.Popen(COMMAND, shell=True, stderr=subprocess.STDOUT, stdout=subprocess.PIPE)
      time.sleep(0.3)
      res = p.communicate()[0].decode('utf-8').split()
      if len(res) != 3: raise Exception("Exception. Unexpected No of returns.")
    except Exception as es:
      U.logExcp("Exception while running: %s. %s" % (COMMAND, repr(ex)))
      res = ['err', 'err', 'err']

    print(res)
    #server_short_name = server[0:3] + server[10:12] + server[7]
    #record = [server_short_name] + res
    #print(record)
    #table.add_row(record)

    # insert into DB
    values_tuple = ([DT, TM, env, server] + res)
    print(values_tuple)
    U.dbInsert(insert_str, values_tuple)

  U.dbClose()
  return ""; #table


def find_recent_reboot():
  COMMAND = "sqlite3 -cmd \".headers on\" -cmd \".mode tabs\" " + U.DB_FILE + " \"select env, server, life from boottime where life<72 order by life asc;\""
  U.logInfo(COMMAND)
  #output = subprocess.check_output(COMMAND)
  #print(output)
  res = None
  try:
    p = subprocess.Popen(COMMAND, shell=True, stderr=subprocess.STDOUT, stdout=subprocess.PIPE)
    time.sleep(0.3)
    res = p.communicate()[0].decode('utf-8')
  except Exception as ex:
    U.logErrr(repr(ex))
    sys.exit(-1)
  #print(res)
  #print("No of records = %d" % (len(res)))
  if len(res)>0:
    U.sendEmail(Email, "Servers Reboot in last 72 hours", res, None)


if __name__ == '__main__':

  find_boot_time('dev', os.getenv('DEV_ALL').split())
  find_boot_time('prd', os.getenv('PRD_ALL').split())

  find_recent_reboot()



