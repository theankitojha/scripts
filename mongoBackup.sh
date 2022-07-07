#!/bin/bash

######################################################################
##
##   MongoDB Database Backup Script
##   Written By: Ankit Ojha
##   URL: ankitojha.com.np
##   Update on: July 7, 2022
##
######################################################################

TODAY=`date +%d%b%Y`

DB_BACKUP_PATH='/home/ubuntu/db-backups'
MONGO_HOST='localhost'
MONGO_PORT='27017'
MONGO_USER='root'
MONGO_PASSWORD='password'
AUTH_DB='admin'
BACKUP_RETENTION_DAYS=30 #Number of days to keep local backup



declare -a databaseNames=(

        [0]=db1
        [1]=db2
        [2]=db3
        [3]=db4
)


for DATABASE_NAME in ${databaseNames[@]}
do


mkdir -p ${DB_BACKUP_PATH}/${DATABASE_NAME}/${TODAY}

echo "DATABASE BACKUP FOR ${DATABASE_NAME} HAS BEEN STARTED !!!"


mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} --username ${MONGO_USER} --password ${MONGO_PASSWORD} -d ${DATABASE_NAME} --authenticationDatabase ${AUTH_DB} --gzip --archive=${DB_BACKUP_PATH}/${DATABASE_NAME}/${TODAY}/${DATABASE_NAME}-${TODAY}.gz

done

        if [ $? -eq 0 ]; then
                echo "DATABASE IS SUCCESSFULLY BACKED UP FOR THE DATABASE ${DATABASE_NAME}"
        else
                echo "!!! ERROR OCCURED DURING BACKUP, BACKUP FAILED !!!"
                exit 1
        fi


