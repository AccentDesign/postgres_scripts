source settings

# NOTES _______________________________________________________________________
# creates the database, user and assigns permissions for that user.

psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -W -d $RESTORE_MAINTENANCE_DB << EOF
CREATE DATABASE $RESTORE_CREATE_DB;
CREATE USER $RESTORE_CREATE_USER WITH PASSWORD '$RESTORE_CREATE_USER_PASSWORD';
ALTER ROLE $RESTORE_CREATE_USER SET client_encoding TO 'utf8';
ALTER ROLE $RESTORE_CREATE_USER SET default_transaction_isolation TO 'read committed';
ALTER ROLE $RESTORE_CREATE_USER SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE $RESTORE_CREATE_DB TO $RESTORE_CREATE_USER;
EOF
