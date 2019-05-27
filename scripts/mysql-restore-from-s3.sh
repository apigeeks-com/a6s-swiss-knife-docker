#!/bin/bash

# S3_PATH - S3 bucket name including prefix (folder) without actual file name (example: bucket_name/some/path)
# BACKUP_FILE_NAME - S3 bucket file name (example: pg_dump_XXXX-XX-XX_XX-XX-XX.gz)

# MYSQL settings
#MYSQL_USER
#MYSQL_HOST
#MYSQL_PASSWORD
#MYSQL_DATABASE

if [ "${BACKUP_FILE_NAME}x" == "x" ]; then
    BACKUP_FILE_NAME=$(aws s3 cp s3://${S3_PATH}/latest-mysql-dump-version.txt - )
fi
echo "Restoring from -> ${BACKUP_FILE_NAME}"
aws s3 cp s3://${S3_PATH}/${BACKUP_FILE_NAME} - | zcat | mysql -u"${MYSQL_USER}" -h"${MYSQL_HOST}" -p"${MYSQL_PASSWORD}" ${MYSQL_DATABASE}

