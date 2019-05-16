# this files install software for a newly built Linux machine


sudo apt install google-chrome
sudo apt install firefox
sudo apt install virtualbox
sudo apt install skype
sudo apt install vlc

# add repositories
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo add-apt-repository ppa:ppa:ubuntu-mozilla-security/ppa
sudo add-apt-repository ppa:linuxuprising/java

# dev software
sudo apt update && apt install openssh* ssh vim initscripts build-essential git python tree vundle tmux sourcetree
sudo apt install arp-scan ipcalc htop nmap ncat netcat net-tools curl dhclient iftop iptables iputils netsniff-ng ngrep ping route socat tcpdump telnet traceroute websocat wget Wireshark
#sudo apt install google-backup-and-sync
