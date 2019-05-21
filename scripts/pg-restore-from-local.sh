#!/bin/sh

# STORAGE_PATH - the place where dump file exist

# PG settings
# PG_HOST
# PG_PORT
# PG_USERNAME
# PG_PASSWORD
# PG_DATABASE

pg_restore --verbose --clean --if-exists --exit-on-error -d postgres://${PG_USERNAME}:${PG_PASSWORD}@${PG_HOST}:${PG_PORT}/${PG_DATABASE} ${STORAGE_PATH}
