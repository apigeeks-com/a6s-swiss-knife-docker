#!/bin/sh

# S3_PATH (required) - S3 bucket name including prefix (folder) without actual file name (example: bucket_name/some/path)
# BACKUP_FILE_NAME - S3 bucket file name (example: mongodump_XXXX-XX-XX_XX-XX-XX.gz)
# STORAGE_PATH - the place where to download the dump file

[ -z "${S3_PATH}" ] && { echo "Please specify S3_PATH" > /dev/stderr; exit 1;}

# MongoDB settings
# MONGO_URI - mongodb://username:pass@host:port/db_name?authSource=db_name

[ -z "${MONGO_URI}" ] && { echo "Please specify MONGO_URI" > /dev/stderr; exit 1;}

if [ "${BACKUP_FILE_NAME}x" == "x" ]; then
    BACKUP_FILE_NAME=$(aws s3 cp s3://${S3_PATH}/latest-mongo-dump-version.txt - )
fi

if [ "${STORAGE_PATH}x" == "x" ]; then
    STORAGE_PATH="/tmp/restore"
fi

echo "Restoring from S3 bucket file -> ${BACKUP_FILE_NAME}"
echo "Copying at -> ${STORAGE_PATH}/${BACKUP_FILE_NAME} local path"

aws s3 cp s3://${S3_PATH}/${BACKUP_FILE_NAME} ${STORAGE_PATH}/${BACKUP_FILE_NAME}

mongorestore --verbose --gzip --archive=${STORAGE_PATH}/${BACKUP_FILE_NAME} --uri ${MONGO_URI} 
