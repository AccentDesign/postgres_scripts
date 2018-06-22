source settings

# NOTES _______________________________________________________________________
# sets the owner to all objects in the RESTORE_CREATE_DB to RESTORE_CREATE_USER

echo -n "Password for ${RESTORE_USER}": 
read -s password
echo

export PGPASSWORD=$password

for tbl in `psql -qAt -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -c "select tablename from pg_tables where schemaname = 'public';" ${RESTORE_CREATE_DB}` \
           `psql -qAt -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" ${RESTORE_CREATE_DB}` \
           `psql -qAt -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -c "select table_name from information_schema.views where table_schema = 'public';" ${RESTORE_CREATE_DB}` ;
do  
    psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -c "alter table \"$tbl\" owner to ${RESTORE_CREATE_USER}" ${RESTORE_CREATE_DB} ;
done

psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -c "ALTER SCHEMA public owner to ${RESTORE_CREATE_USER}" ${RESTORE_CREATE_DB} ;
