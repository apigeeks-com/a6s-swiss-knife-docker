Docker Image for MongoDB, PG, MySQL, AWS S3 backups restore based on [Alpine Linux](http://www.alpinelinux.org), [mongorestore](https://docs.mongodb.com/manual/reference/program/mongorestore/), [mysql](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html), [pg_dump](https://www.postgresql.org/docs/9.3/app-pgdump.html) and [awscli](https://github.com/aws/aws-cli)

The purpose of this image is to restore backups from K8S instance that has direct access to backup S3 bucket through proper configured IAM policy.
