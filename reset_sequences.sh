source settings

# NOTES _______________________________________________________________________
# resets all sequence values in RESTORE_CREATE_DB for the 'public' schema

echo -n "Password for ${RESTORE_USER}": 
read -s password
echo

export PGPASSWORD=$password

psql -qAt -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -d $RESTORE_CREATE_DB \
-c "SELECT 'SELECT SETVAL(' ||quote_literal(N.nspname || '.' || S.relname)|| ', MAX(' ||quote_ident(C.attname)|| ') ) FROM ' || quote_ident(N.nspname) || '.' || quote_ident(T.relname)|| ';'
    FROM pg_class AS S \
    INNER JOIN pg_depend AS D ON S.oid = D.objid \
    INNER JOIN pg_class AS T ON D.refobjid = T.oid \
    INNER JOIN pg_attribute AS C ON D.refobjid = C.attrelid AND D.refobjsubid = C.attnum \
    INNER JOIN pg_namespace N ON N.oid = S.relnamespace \
    WHERE S.relkind = 'S' AND N.nspname = 'public' \
    ORDER BY S.relname" \
| while read SQL
do
    psql -h $RESTORE_HOST -p $RESTORE_PORT -U $RESTORE_USER -d $RESTORE_CREATE_DB -c "${SQL}"
done
