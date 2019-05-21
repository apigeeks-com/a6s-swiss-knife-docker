#!/bin/sh

# S3_PATH - S3 bucket name including prefix (folder) without actual file name (example: bucket_name/some/path/pg_dump_XXXX-XX-XX_XX-XX-XX.gz)

# PG settings
# PG_HOST
# PG_PORT
# PG_USERNAME
# PG_PASSWORD
# PG_DATABASE

aws s3 cp --quiet s3://${S3_PATH} - | \
 pg_restore --verbose --clean --if-exists --exit-on-error -d postgres://${PG_USERNAME}:${PG_PASSWORD}@${PG_HOST}:${PG_PORT}/${PG_DATABASE}
