tutum-docker-postgresql
=======================

**This image will be deprecated soon. Please use the docker official image:** https://hub.docker.com/_/postgres/

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Base docker image to run a PostgreSQL database server


Usage
-----

To create the image `tutum/postgresql`, execute the following command on the tutum-docker-postgresql folder:

	docker build -t tutum/postgresql .

To run the image and bind to port 5432:

	docker run -d -p 5432:5432 tutum/postgresql

The first time that you run your container, a new user `postgres` with all privileges
will be created in PostgreSQL with a random password. To get the password, check the logs
of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this PostgreSQL Server using:

	    psql -h <host> -p <port> --username=postgres
	and enter the password 'HHrUZyI6ubWF' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `HHrUZyI6ubWF` is the password assigned to the `postgres` user.

Done!


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `POSTGRES_PASS` to your specific password when running the container:

	docker run -d -p 5432:5432 -e POSTGRES_PASS="mypass" tutum/postgresql


Mounting the database file volume
---------------------------------

Coming soon!


Migrating an existing PostgreSQL Server
----------------------------------

Coming soon!
