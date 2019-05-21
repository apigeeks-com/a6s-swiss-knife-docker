#!/bin/bash

# S3_PATH - should contain S3 bucket name and path to backup file (example: bucket_name/some/path/mysqldump_XXXX-XX-XX_XX-XX-XX.sql.gz)

#MYSQL_USER
#MYSQL_HOST
#MYSQL_PASSWORD
#MYSQL_DATABASE

echo "Restore dump for database '${MYSQL_DATABASE}'..."
aws s3 cp s3://${S3_PATH} - | zcat | mysql -u"${MYSQL_USER}" -h"${MYSQL_HOST}" -p"${MYSQL_PASSWORD}" ${MYSQL_DATABASE}
