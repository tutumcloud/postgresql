#!/bin/bash

cd /etc/postgresql/*/*
sed -i -r "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" postgresql.conf
sed -i -r "s/127.0.0.1\/32/0.0.0.0\/0/" pg_hba.conf
touch .listen_addr_modified
