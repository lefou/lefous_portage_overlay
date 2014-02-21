#!/bin/bash
# Copyright (c) 2005 by Tobias Roeser
# All rights reserved

BACKUP_DIR="${HOME}/ebackup"
BACKUP_PREFIX="$(hostname)"
BACKUP_CONF_DIRS="${HOME}/.ebackup_files"

#######################################################

VERSION="0.1"
VERSION_STRING="ebackup ${VERSION} - Copyright (c) 2005 by Tobias Roeser"

USE_CONF_DIRS="no"
DIRECTORIES=""

#######################################################

if [ -e "${BACKUP_CONF_DIRS}" ]; then
	echo " * Using configuration file at ${BACKUP_CONF_DIRS}"
	USE_CONF_DIRS="yes"
	DIRECTORIES="$(cat ${BACKUP_CONF_DIRS} | grep -v '^#' )"
else
	echo "!!! There is no configuration file at ${BACKUP_CONF_DIRS}"
	# DIRECTORIES="/etc /var/lib/portage /var/log"
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
    ( tar cjf "${filebase}${directory//\//-}.tar.bz2" "${directory}" && echo ">>> Done" ) || echo "!!! Error"
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

	sleep 2;

	for i in ${DIRECTORIES}; do
		backup_dir $i
	done
fi

# finish
echo ">>> Finished"			    

#######################################################
