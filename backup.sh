#!/bin/bash
################################################################################
#
# Desc:		backs up different source folders to target folders
# Author:	Salah Chohan
# Date:   20-Apr-2025
# Usage:	backup.sh
#
################################################################################

#SOURCE=("Documents" "Archive" "Pictures" "Projects" "Audios")
SOURCE=("Projects")
TARGET="/mnt/f"
DATE=$(date +%Y%m%d)
# sudo mount -t drvfs F: /mnt/f

echo "Please enter sudo password: "
read -s PASS

mkdir -p "${TARGET}/${DATE}"

for i in "${!SOURCE[@]}"; do
  INPUT="/d/${SOURCE[$i]}/"
  OUTPUT="${TARGET}/${DATE}/${SOURCE[$i]}/"
	echo "$PASS" | sudo -S rsync -avz --delete \
  	--exclude='*.exe' --exclude='*.log' \
		--exclude="log/*" --exclude="bin/*" --exclude="lib/*" \
		--exclude="tmp/*" --exclude="temp/*" --exclude="dump/*" \
		--exclude="Classes/*" --exclude=".git/*" --exclude=".metadata/*" \
		--exclude="node_modules/*" \
		--exclude="Docker/jdk*" --exclude="Docker/sqlcl*" \
		--exclude="Docker/instantclient*" --exclude="Docker/node*" \
		--exclude="Docker/oracle-xe*" --exclude="Docker/redis-cli" \
		--exclude="TNA/runtime/data/*" --exclude="TNA/runtime/install/*" \
		--exclude="TNA/runtime/rpt/*" --exclude="ACCS/web-orig/*" \
		--exclude="TNA/misc/Biometric" \
		--exclude="Python/git_20200213/*" \
		"${INPUT}" "${OUTPUT}"
done

