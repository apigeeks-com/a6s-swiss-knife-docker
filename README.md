# Swiss Knife Docker Image

This image is based on [Alpine Linux](http://www.alpinelinux.org) and serves to manage restore operation over MongoDB, PostrgrSQL, MySQL, MinIO services from dumps stored on AWS:S3 bucket(s).

Installed tools:
- [mongorestore](https://docs.mongodb.com/manual/reference/program/mongorestore/)
- [mysqldump](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html)
- [pg_dump](https://www.postgresql.org/docs/9.3/app-pgdump.html)
- [awscli](https://github.com/aws/aws-cli)
- [/s3-to-minio]('./s3-to-minio/README.md)

The purpose of this image is to restore backups from K8S instance that has direct access to S3 bucket through proper configured IAM policy.
