####################################################################################################
#
# Desc: It create/copies various profile/personal files
# Auth: Salah Chohan
# Date: 11-09-2022
# Usage: init_server.sh
# pre-req: export SERVER_SET=<space delimited list of servers>
#
####################################################################################################
#echo "Please enter your password:"
#read -s PASSWORD
echo $SERVER_SET

for s in $SERVER_SET
do 
	echo "##### $s #####"
	#sshpass -p $PASSWORD ssh -o "StrictHostKeyChecking no" -q $a "mkdir ~/.ssh" 2>/dev/null
	#sshpass -p $PASSWORD scp -p ~/.ssh/authorized_keys $s:~/.ssh. 2>/dev/null
	ssh-copy-id $s; ssh-copy-id -i ~/.ssh/id_rsa.pub $s
	scp -pq ~/.ssh/id_rsa* $s:~/.ssh/.
	scp -pq ~/.bashrc $s:~/.
	scp -pq ~/.viminfo $s:~/.
	rsync -e 'ssh -q' -avz ~/bin $s:~/
done

