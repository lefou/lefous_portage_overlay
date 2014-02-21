#!/bin/bash
# Copyright (c) 2005 by Tobias Roeser
# All rights reserved

#######################################################
# Defaults

BACKUP_CONF="${HOME}/.ebackuprc"
BACKUP_DIR="${HOME}/ebackup"
BACKUP_PREFIX="$(hostname)"
DIRECTORIES=""
EXCLUDE_DIRS=""
EXCLUDE_STATEMENT=""

if [ -f ${BACKUP_CONF} ]; then
	source ${BACKUP_CONF}
else
	cat > ${BACKUP_CONF} << "EOF"
BACKUP_DIR="${HOME}/ebackup"
BACKUP_PREFIX="$(hostname)"
DIRECTORIES=""
EXCLUDE_DIRS=""
EOF

fi

#######################################################
# !! Do not change anything below this line !!

VERSION="0.3"
VERSION_STRING="ebackup ${VERSION} - Copyright (c) 2005 by Tobias Roeser"

#######################################################

if [[ -z ${DIRECTORIES} ]]; then
	echo "!!! There are no directories given. Please fill the DIRECTORIES varibale in ${BACKUP_CONF}"
	exit 0;
fi

prepare_backup_dir() {			    
    echo " * Backup directory: ${BACKUP_DIR}"
    mkdir -p ${BACKUP_DIR} || echo "!!! Error: could not create Directory ${BACKUP_DIR}"
    echo " * Backup prefix: ${BACKUP_PREFIX}"
}

backup_dir() {
    directory=$1
    date=$(date +%G_%m_%d-%H_%M_%S)
    filebase="${BACKUP_DIR}/${BACKUP_PREFIX}-${date}"
    echo ">>> Backup ${directory}..."
    ( tar cjf "${filebase}${directory//\//-}.tar.bz2" "${directory}" ${EXCLUDE_STATEMENT} && echo ">>> Done" ) || echo "!!! Error"
}

#######################################################

echo "${VERSION_STRING}"

prepare_backup_dir

if [ -z "${DIRECTORIES}" ]; then
	echo " * No backup directories given"
else 

	echo " * Backups for the following directories requested:"
	for i in ${DIRECTORIES}; do
		echo "    - $i"
	done

	if [[ -n ${EXCLUDE_DIRS} ]]; then
		echo " * Adding exclude pattern"
		# preparing exclude statement
		for pattern in ${EXCLUDE_DIRS}; do
			EXCLUDE_STATEMENT=" --exclude=${pattern}"
			echo "    - ${pattern}"
		done
	fi

	sleep 2;

	for i in ${DIRECTORIES}; do
		backup_dir $i
	done
fi

# finish
echo ">>> Finished"			    

#######################################################
