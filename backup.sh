source settings

pg_dump -Fc -v -h $BACKUP_HOST -p $BACKUP_PORT -U $BACKUP_USER -W $BACKUP_DB > $BACKUP_FILE
