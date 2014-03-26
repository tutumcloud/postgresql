#!/bin/bash

#modify default listen addr on IPv4
if [ ! -f /.listen_addr_modified ]; then
	/modify_listen_addr.sh
fi

#start the service 
service postgresql start
sleep 3

#change the password
if [ ! -f /.postgres_pass_modified ]; then
	/modify_postgres_pass.sh
fi

#connect to PostgreSQL
exec psql -h 127.0.0.1 -U postgres
