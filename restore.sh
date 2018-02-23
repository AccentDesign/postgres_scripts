source settings

# IMPORTANT ___________________________________________________________________
# this will wipe the database so make sure you are pointing to the correct one.
# you wont get it back again

# NOTES _______________________________________________________________________
# will restore the db ignoring the original owner in the backup, owner will 
# be $RESTORE_USER
# if the database is new then you dont need the 'c' (clean) argument

pg_restore -c -v -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -W --no-owner -d $RESTORE_CREATE_DB $BACKUP_FILE
