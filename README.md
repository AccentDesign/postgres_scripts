# Postgres Script

1. Backup
2. Create DB and User
3. Restore
4. Switch Owner on DB Objects
5. Reset Sequences

Update the settings file and then run the commands in order:

1. backup.sh
2. create_db_and_user.sh
3. restore.sh
4. switch_owner.sh
5. reset_sequences.sh

> When restoring a database please ignore the clean database errors as these occur due to the clean being unable to delete pre-existing database tables in an empty database.

## Useful Commands

Load setting variables in shell

    source settings

Connect to backup db

    psql -h $BACKUP_HOST -p $BACKUP_PORT -U $BACKUP_USER -W -d $BACKUP_DB

Connect to restored db

    psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -W -d $RESTORE_CREATE_DB