#!/bin/bash
#############################################################################################################
#
# Desc: DB config for command line
# Auth: Salah Chohan
# Date: 19-May-2024
# Use:  sourced in ~/.bashrc
# Pre-requisite: ~/.ssh/.credential.gpg, ~/.ssh/.passphrase
#
#############################################################################################################

# decrypt password
PASSWD=$(gpg --batch -d --passphrase-file ~/.ssh/.passphrase ~/.ssh/.credential.gpg 2>/dev/null)

export DB_INSTANCE='server-name:1234/service-name'

export DB_USER_PASS="username/${PASSWD}"

# EASYCONNECT strings
#alias db_tfx="sqplus ${DB_USER_PASS}@${DB_INSTANCE}"

# TNSNAMES strings
alias db_tfx="sqlplus ${DB_USER_PASS}@TFX1P"

export DB_SCHEMAS="'MODENA', 'EDEAL'"
alias ft="echo \"select substr(owner,1,10), substr(table_name,1,35) from all_tables where owner not in ('SYS','SYSTEM','XDB') order by owner, table_name;\"|db_tfx|egrep -i"
function ftc { echo "SELECT substr(owner,1,10), substr(table_name,1,30), substr(column_name,1,35) FROM all_tab_columns WHERE owner not in ('SYS','SYSTEM','XDB') and regexp_like(column_name, '$1', 'i') order by owner, table_name, column_name;" | db_tfx | egrep -i "$1"; ); export -f ftc


