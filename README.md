# RDS to S3 Backup Script

The amazon AWS RDS Service is amazing and creates really good backups in most
cases.  The only problem I've ran into is that sometimes you want more backups
than what AWS allows or you want to do them a different intervals and keep
them offsite.  Typically AWS RDS Backups are stored on a S3 but you can't get
to them.  This simple script dumps the data out of the RDS straight to Amazon
AWS S3 using the `s3cmd` and the native `mysqldump` that comes with ubuntu.
Steps to install and configure are listed below.

## Install Prerequisites

This install assumes you are on an amazon ec2 instance running ubuntu 15.04.
If this is not the case you may use this as a guide to install via your
favorite flavor of Linux.

- `$ sudo apt-get install -y s3cmd`
- `$ sudo apt-get install -y mysql-client-5.6`

## Configuration

