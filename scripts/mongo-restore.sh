#!/bin/sh

# S3_PATH - S3 bucket name including prefix (folder) without actual file name (example: bucket_name/some/path)
# DUMP_FILE_NAME - dump file name (example: mongodump_XXXX-XX-XX_XX-XX-XX.gz)
# STORAGE_PATH - the place where to download the dump file

# MongoDB settings
# MONGODB_HOST
# MONGODB_PORT
# MONGODB_USERNAME
# MONGODB_PASSWORD
# MONGODB_DATABASE

aws s3 cp s3://${S3_PATH}/${DUMP_FILE_NAME} ${STORAGE_PATH}/${DUMP_FILE_NAME}

mongorestore --verbose --gzip --archive=${STORAGE_PATH}/${DUMP_FILE_NAME} --uri mongodb://${MONGODB_USERNAME}:${MONGODB_PASSWORD}@${MONGODB_HOST}:${MONGODB_PORT}/${MONGODB_DATABASE}?authSource=${MONGODB_DATABASE}
