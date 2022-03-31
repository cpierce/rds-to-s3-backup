# RDS to S3 Backup Script

The amazon AWS RDS Service is amazing and creates really good backups in most
cases.  The only problem I've ran into is that sometimes you want more backups
than what AWS allows or you want to do them a different intervals and keep
them offsite.  Typically AWS RDS Backups are stored on a S3 but you can't get
to them.  This simple script dumps the data out of the RDS straight to Amazon
AWS S3 using the `s3cmd` and the native `mysqldump` that comes with ubuntu.
Steps to install and configure are listed below.

## Install Prerequisites

This install assumes you are on an amazon ec2 instance running ubuntu.
If this is not the case you may use this as a guide to install via your
favorite flavor of Linux.

- `$ sudo apt install -y s3cmd`
- `$ sudo apt install -y mysql-client`

## Configuration

First get your EC2 to connect by default to the RDS.  This can be done with a
simple file placed at `~/.my.cnf`.  A sample of this file is located in the
samples folder in this git repo.  After this is done configure your s3cmd
using `s3cmd --configure`.  You will need your IAM info for s3 at this point.

Last edit the rdstos3backup.sh script and edit the top few lines to suite your
needs.  Fix to suite your needs and then save the file in
`/usr/local/bin/`.

## Crontab

Optionally you might want to put this script in a crontab to run every night.
You can achieve this by using the folllowing crontab:

```
*    3    *    *    *   /usr/local/bin/rdstos3backup.sh 1>/dev/null >&2
```
