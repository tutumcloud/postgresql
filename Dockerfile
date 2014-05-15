FROM ubuntu:trusty
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

#Install PostgreSQL-9.3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-9.3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pwgen

# Adjust PostgreSQL configuration so that remote connections to the database are possible. 
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf


# Add VOLUMEs to allow backup of config, logs and databases
VOLUME	["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

ADD modify_postgres_pass.sh ./modify_postgres_pass.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 5432
CMD ["/run.sh"]
