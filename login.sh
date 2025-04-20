#############################################################################################################
#
# Desc: This scripts logs into each server and portal
# Auth: Salah Chohan
# Date: 08-Nov-2024
# Use:  login.sh
# Pre-requisite: ~/script/servers.sh, ~/.ssh/.credential.gpg, ~/.ssh/.passphrase, ~/script/dbConfig.sh
#
#############################################################################################################
shopt -s expand_aliases


source ~/script/servers.sh
USERNAME="zk38uzf"
PASSWD=""

# decrypt password
PASSWD=$(gpg --batch -d --passphrase-file ~/.ssh/.passphrase ~/.ssh/.credential.gpg 2>/dev/null)
if [ -z "${PASSWD}" ]; then
  read -s -p "Enter your password : " PASSWD
fi
BASICAUTH="`echo -n "${USERNAME}:${PASSWD}" | base64`"
echo "BasicAuth: $BASICAUTH"


# Databases
echo -e "\n\n\n\n\n####### Database logins $(date '+%Y-%m-%d %H:%M:%S') starts #######" | tee -s ${LOG_FILE}
source ~/script/dbConfig.sh
echo "select systimestamp from dual;"| db_tfx
echo -e "\n\n\n\n\n####### Database logins $(date '+%Y-%m-%d %H:%M:%S') ends #######" | tee -s ${LOG_FILE}


# Support Tools
AUTH_ADMIN="https://gfxtools${ENV}.bankofamerica.com/tools/authadmin"
CACHE_ADMIN="https://gfxtools${ENV}.bankofamerica.com/gfx-cache-admin"
DEAL_KILLER="https://gfxtools${ENV}.bankofamerica.com/dealkiller"
GFXTOOLS="https://gfxtools${ENV}.bankofamerica.com/tools/home/"
ENVs="-dev3 -dev4 -dev5 -perfx -perfx5"
for env in $ENVs
  do
    echo -e "\n\n\n##### Env: $env"

    url="${AUTH_ADMIN}"
    echo -e "\n##### Support tool: $url"
    curl -k --max-time 75 -X POST ${url}

    url="${CACHE_ADMIN}"
    echo -e "\n##### Support tool: $url"
    curl -k --max-time 75 -X POST ${url}

    url="${DEAL_KILLER}"
    echo -e "\n##### Support tool: $url"
    curl -k --max-time 75 -X POST ${url}

    url="${GFXTOOLS}"
    echo -e "\n##### Support tool: $url"
    curl -k --max-time 75 -X POST ${url}
  done

curl -k --max-time 75 -X GET https://gfxtools.bankofamerica.com/wmd


# Weblogic Admin Consoles

# Login to CPFX envs
ENVs="dev1 dev2 dev3 dev4 dev5 perfx-bd"
for env in $ENVs
  do
    echo -e "\n\n\n##### CPFX: $env"
    url="https://gfx${env}.bankofamerica.com/FXtransact/t2cp/admin/worklist.do"
    echo "$url"
    curl -k --max-time 75 -X POST -d "UID=${USERNAME}" ${url}
  done


# Portals
ARTIFACTORY="https://artifacts.horizon.bankofamerica.com/artifactory/libs-snapshots-local-generic/com/baml/cpfxtd"
ANSIBLE="https://deploynp.runit.bankofamerica.com/#/login"
JENKINS="https://usvxaptfxd25.sdi.corp.bankofamerica.com:8084/beano/login"
CHECKMARX="https://checkmarx.bankofamerica.com/cxwebclient/Login.aspx"
SPLUNK="https://splunk.bankofamerica.com/en-US/account/login"
SPLUNK_QA="https://splunk-qa.bankofamerica.com/en-US/account/login"
PORTALs="${ARTIFACTORY} ${ANSIBLE} ${JENKINS} ${CHECKMARX} ${SPLUNK} ${SPLUNK_QA}"
for url in $PORTALs
  do
    echo -e "\n\n\n##### $url"
    curl -k -H "Authorization: Basic ${BASICAUTH}" --max-time 75 ${url}
  done

# Login to Linux servers
# rr 'hostname' $SERVERS_ALL
cmd='hostname';
for S in $SERVERS_ALL;
do
  echo -e "\n####### $S #######";
  sshpass -p $PASSWD ssh -o "StrictHostKeyChecking no" -q ${USERNAME}@${S} "$cmd";
done

    
