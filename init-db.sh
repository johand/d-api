#!/bin/sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE "${DB_NAME}_development";
	CREATE DATABASE "${DB_NAME}_test";
EOSQL
