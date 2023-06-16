#set -o errexit
#set -o errtrace
#trap 'exit "script ${0} aborted at ${LINENO}"; exit 1' ERR

# shell options
shopt -s checkjobs
shopt -s dotglob
shopt -s expand_aliases
shopt -s histappend
shopt -s no_empty_cmd_completion

# sources

# modules

# exports
export HOST=$(hostname)
export ORACLE_HOST=$(hostname)
export DISPLAY=127.0.0.1:0
export TERM=xterm
export COLUMNS=2000
export PS1="\[\t\e[1;32m\]\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"
export HISTSIZE=1000
export HISTTIMEFORMAT="%Y%m%d-%H%M%S  "
export HISTIGNORE="pwd:clear:cls:cd:ls:man:history"
#export CLASSPATH=
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='mt=1;34'

# aliases
alias c='clear'
alias f='find . -type f | xargs -d "\n" egrep -In'
alias g='egrep -Irn'
alias ff='find . -type f | egrep'   # ff "(cpp|h)$" | xargs grep test
alias ffd='find / -path /c -prune -o -path /d -prune -o -path /e -prune -o -name'
alias fd='find . -type d | egrep'
alias fc='ff -i "\.(c|h|cpp|hpp)$"|xargs -d "\n" egrep -In'
alias fcs='ff -i "\.cs$"|xargs -d "\n" egrep -In'
alias fj='ff "\.java$"|xargs -d "\n" egrep -In'
alias fjs='ff "\.js$"|xargs -d "\n" egrep -In'
alias fts='ff "\.ts$"|xargs -d "\n" egrep -In'
alias fp='ff "\.py$"  |xargs -d "\n" egrep -In'
alias fsh='ff "\.sh$"  |xargs -d "\n" egrep -In'
alias fsql='ff "\.sql$"  |xargs -d "\n" egrep -In'
alias ftxt='ff "\.txt$" |xargs -d "\n" egrep -In'
alias fxml='ff "\.xml$" |xargs -d "\n" egrep -In'
alias flog='ff "\.log$"  |xargs -d "\n" egrep -In'
alias flogECF='ff "\.log$"  |xargs -d "\n" egrep -In "ERROR|CRITICAL|FATAL"'
alias h='history|less'
alias ls='ls --color=auto'
alias l='ls -lahr'
alias lt='ls -latr'
alias ld='ls -lahrd */'
alias lf='ls -lahr|grep -v ^d'
alias IP="ip a|grep inet|fgrep -v '127.0.0.1'"
alias ipgrep='grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"'
alias grepip='egrep "([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})"|egrep -v "127.0.0.1"'
alias cd2Doc='cd /d/Documents'
alias cd2Fin='cd /d/Finance'
alias cd2p='cd /d/Projects'
alias cd2a='cd /d/Projects/ACCS'
alias cd2d='cd /d/Projects/Docker'
alias cd2tc='cd /d/Test/C'
alias cd2tp='cd /d/Test/P'
alias cd2tsql='cd /d/Test/sql'
alias ..='cd ..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias chs='chmod +x'
alias ddu='du -sh * | sort -hr | head -20'
#alias vi='vim -u /d/Projects/Linux-script/.vimrc'
alias vimdiff="vimdiff -c 'set diffopt+=iwhite'"
#alias grep='egrep'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias py='winpty /c/Python/Python37/python'
alias pcap2fix="strings|sed -z 's/\n/;/g'|sed 's/;8=FIX.4./\n8=FIX.4./g'|sed 's/;10=.*/;10=000/g'"
# external folders
#alias host-c='sshfs salah@${HOST}:/c/ /c'

# DB alias
alias db-oracle='sql accs/accs@${ORACLE_HOST}:11521/xe_accs'
alias ft='echo "select table_name from user_tables;"|db-oracle|egrep -i'
function ftc { echo "SELECT substr(table_name,1,15), substr(column_name,1,15) FROM all_tab_columns WHERE owner='v26' and regexp_like(table_name, '^cdm|dm.+', 'i') and regexp_like(column_name, '$1', 'i');" | db-oracle | egrep -v "SUBSTR|\-\-\-\-"; }; export -f ftc

function fif { find . -type f | egrep "\.($2)$" | xargs egrep $1; }; export -f fif
heta() { head -n $2 | tail -n $(($2-$1+1)); }; export -f heta
function k { kill -9 $(pgrep $1); }; export -f k
generateqr () { printf "$@" | curl -F-=\<- qrenco.de; }; export -f generateqr
function run_remote() {
  for S in $SERVER_SET
  do
    echo -e "\n########## $S ##########"
    ssh -o "StrictHostKeyChecking no" -q $S "$@"
  done
}; export -f run_remote
function run_remote_pass() {
  echo "Enter Password: "
  read -s PASS

  for S in $SERVER_SET
  do
    echo -e "\n########## $S ##########"
    sshpass -p $PASS ssh -o "StrictHostKeyChecking no" -q $S "$@"
  done
}; export -f run_remote_pass

source /c/init.sh

