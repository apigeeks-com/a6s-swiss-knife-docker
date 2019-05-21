#!/bin/bash

# PATH_TO_DUMP - path and name of the dump file (example: /var/dump/mysqldump_XXXX-XX-XX_XX-XX-XX.sql.gz)

#MYSQL_USER
#MYSQL_HOST
#MYSQL_PASSWORD
#MYSQL_DATABASE

echo "Restore dump for database '${MYSQL_DATABASE}'..."
zcat PATH_TO_DUMP | mysql -u"${MYSQL_USER}" -h"${MYSQL_HOST}" -p"${MYSQL_PASSWORD}" ${MYSQL_DATABASE}
