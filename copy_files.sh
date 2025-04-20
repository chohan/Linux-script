#!/bin/bash
####################################################################################################
#
# Desc: copies files to other servers
# Auth: Salah Chohan
# Date: 11-09-2022
# Usage: copy_files.sh <list of servers>
#
####################################################################################################

PASSWORD=$(gpg --batch -d --passphrase-file ~/.ssh/.passphrase ~/.ssh/.credential.gpg 2>/dev/null)
if [ -z "${PASSWORD}" ]; then
  read -s -p "Enter your password : " PASSWORD
fi
SERVERS=$@
echo $SERVERS

for s in $SERVERS
do 
	echo "\n\n##### $s #####"
  /usr/bin/sshpass -p $PASSWORD scp -pq ~/.bashrc $s:~/.;
  /usr/bin/sshpass -p $PASSWORD scp -pq ~/.vimrc $s:~/.;
  /usr/bin/sshpass -p $PASSWORD scp -pq ~/.viminfo $s:~/.;
  /usr/bin/sshpass -p $PASSWORD scp -pq ~/init.sh $s:~/.;
  echo ""
done

