Docker Image for MongoDB, PG, MySQL, AWS S3 backups restore based on [Alpine Linux](http://www.alpinelinux.org), [mongodump](https://docs.mongodb.com/manual/reference/program/mongodump/), [mysql](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html), [pg_dump](https://www.postgresql.org/docs/9.3/app-pgdump.html) and [awscli](https://github.com/aws/aws-cli)

The purpose of this image is to make the restore backups from K8S instance that has direct access to backup S3 bucket through proper configured IAM policy.

## Use

### Environment variables

- `S3_BUCKET` - S3 bucket name where backups will be stored may also include the sub-folder path (e.g.: `bucket/sub-folder`).

## IAM Policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412000000001",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME"
            ]
        },
        {
            "Sid": "Stmt1412000000002",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::BUCKET_NAME/*"
            ]
        }
    ]
}
```
