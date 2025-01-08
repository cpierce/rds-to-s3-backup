#!/bin/bash
BACKUP_DATE=$(date +"%Y-%m-%d")
BACKUP_OPTIONS=""
BACKUP_S3PATH='s3://bucketname/folder'
BACKUP_USER="postgres"

# Get a list of all databases, excluding template0 and template1
DB_LIST=$(psql -U $BACKUP_USER -t -c "SELECT datname FROM pg_database WHERE datistemplate = false;")

for db in $DB_LIST; do
    echo "Creating DB Backup: $db"
    # Dump the database, compress it, and upload it to S3
    /usr/bin/pg_dump -U postgres "$db" | /bin/gzip | /usr/bin/s3cmd "$BACKUP_OPTIONS" put - "$BACKUP_S3PATH"/"$BACKUP_DATE"/"$db".sql.gz >/dev/null 2>&1
done

echo "Done"
