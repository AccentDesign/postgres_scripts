source settings

echo -n "Password for ${RESTORE_USER}":
read -s password
echo

export PGPASSWORD=$password

# vacuum the restored db
psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -d $RESTORE_CREATE_DB -c "VACUUM FULL VERBOSE ANALYZE"
# rebuild all indexes in the restored db
psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -d $RESTORE_CREATE_DB -c "REINDEX DATABASE ${RESTORE_CREATE_DB}"
