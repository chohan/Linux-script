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

# aliases
alias c='clear'
alias f='find . -type f | xargs -d "\n" grep -n'
alias g='egrep -Irn'
alias ff='find . -type f | egrep'   # ff "(cpp|h)$" | xargs grep test
alias fd='find . -type d | egrep'
alias fc='ff -i "\.(c|h|cpp|hpp)$"|xargs -d "\n" egrep -n'
alias fj='ff "\.java$"|xargs -d "\n" egrep -n'
alias fp='ff "\.py$"  |xargs -d "\n" egrep -n'
alias ftxt='ff "\.txt$" |xargs -d "\n" egrep -n'
alias fxml='ff "\.xml$" |xargs -d "\n" egrep -n'
alias fsh='ff "\.sh$"  |xargs -d "\n" egrep -n'
alias h='history|less'
alias l='ls -lah' # --color auto'
alias ipgrep='grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"'
#alias cd2c='cd /cygdrive/c'
#alias cd2d='cd /cygdrive/d'
#alias cd2e='cd /cygdrive/e'
#alias cd2f='cd /cygdrive/f'
#if [[ $(uname -s) == "CYGWIN"* ]]; then alias sudo="cygstart --action=runas"; fi
#alias sudo="cygstart --action=runas"
alias l='ls -lah --color=auto'
alias ipgrep='grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"'
alias cd2p='cd /d/Projects'
alias cd2Doc='cd /d/Documents'
alias cd2Fin='cd /d/Finance'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias vi='vim -u /d/Projects/Linux-script/.vimrc'
#alias grep='egrep'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# exports
export DISPLAY=127.0.0.1:0
export PATH=$PATH:$SYSTEMROOT/system32
export COLUMNS=2000
export PS1="\[\t\e[1;32m\]\[\e]0;\w\a\]\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='mt=1;34'


# shells
#function f1 {
#	find . -name "$1" -exec grep $2 {} \; -print
#}

function fff { find . -type f | egrep "\.($2)$" | xargs egrep $1; }
heta() { head -n $2 | tail -n $(($2-$1+1)); } 
