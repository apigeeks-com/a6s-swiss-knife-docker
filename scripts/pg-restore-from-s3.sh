#!/bin/sh

# S3_PATH - S3 bucket name including prefix (folder) without actual file name (example: bucket_name/some/path)
# BACKUP_FILE_NAME - S3 bucket file name (example: pg_dump_XXXX-XX-XX_XX-XX-XX.gz)

# PG settings
# POSTGRES_URI - postgres://username:password@host:5432/databasename

if [ "${BACKUP_FILE_NAME}x" == "x" ]; then
    LATEST_BACKUP_FILE_NAME=$(aws s3 cp s3://${S3_PATH}/latest-postgresql-dump-version.txt - )
    echo "Restoring from -> l${LATEST_BACKUP_FILE_NAME}"
    aws s3 cp --quiet s3://${S3_PATH}/${LATEST_BACKUP_FILE_NAME} - | \
        pg_restore --verbose --clean --if-exists --exit-on-error -d ${POSTGRES_URI}

else
    echo "Restoring from -> l${BACKUP_FILE_NAME}"
    aws s3 cp --quiet s3://${S3_PATH}/${BACKUP_FILE_NAME} - | \
        pg_restore --verbose --clean --if-exists --exit-on-error -d ${POSTGRES_URI}
fi
