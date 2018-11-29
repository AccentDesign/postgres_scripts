Backup and restore your Postgres DBs with these scripts.

# Postgres Script

Rename '_settings' to 'settings' and update the configuration

Update the PG_BIN path to point to your local Postgres installation directory.

Run the following commands in order:

1. backup.sh
2. create_db_and_user.sh
3. restore.sh
4. reset_sequences.sh
5. housekeeping.sh
    - vacuum the restored db
    - rebuild all indexes in the restored db
6. switch_owner.sh
    - public objects
    - public schema

> When restoring a database please ignore the clean database errors as these occur due to the clean being unable to delete pre-existing database tables in an empty database.

## Useful Commands

Load setting variables in shell

    source settings

Connect to backup db

    psql -h $BACKUP_HOST -p $BACKUP_PORT -U $BACKUP_USER -W -d $BACKUP_DB

Connect to restored db

    psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -W -d $RESTORE_CREATE_DB
