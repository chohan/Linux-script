#!/bin/bash
####################################################################################################
#
# Desc: It create/copies various profile/personal files
# Auth: Salah Chohan
# Date: 11-09-2022
# Usage: init_server.sh
# pre-req: export SERVER_SET=<space delimited list of servers>
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
	echo "##### $s #####"
  # sshpass =p $PASSWORD ssh-copy-id -i ~/.ssh/id-rsa.pub $s
  # sshpass =p $PASSWORD ssh-copy-id $s
	# sshpass -p $PASSWORD scp -pq ~/.ssh/id_rsa* $s:~/.ssh/.

  echo -e "\nSetting ssh keys"
	sshpass -p $PASSWORD ssh -o "StrictHostKeyChecking no" -q $s "mkdir ~/.ssh"
	sshpass -p $PASSWORD scp -pq ~/.ssh/id_rsa* $s:~/.ssh/.
	sshpass -p $PASSWORD scp -pq ~/.ssh/authorized_keys $s:~/.ssh/.

  echo -e "\nCopying customization files"
	sshpass -p $PASSWORD scp -pq ~/.profile $s:~/.
	sshpass -p $PASSWORD scp -pq ~/.bashrc $s:~/.
	sshpass -p $PASSWORD scp -pq ~/.vimrc $s:~/.
	sshpass -p $PASSWORD scp -pq ~/.viminfo $s:~/.

  echo -e "\nCopying bin and script folders"
	sshpass -p $PASSWORD ssh -o "StrictHostKeyChecking no" -q $s "mkdir ~/{bin,script,cfg,tmp,data} /var/tmp/Salah; chmod 777 /var/tmp/Salah; touch ~/.host.ini"
	sshpass -p $PASSWORD rsync -e 'ssh -q' -avz ~/bin $s:~/.
	sshpass -p $PASSWORD rsync -e 'ssh -q' -avz ~/script/servers.sh $s:~/script/.
  echo ""
done

