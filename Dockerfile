FROM ubuntu:saucy
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

#install PostgreSQL
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pwgen
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql

ADD modify_postgres_pass.sh ./modify_postgres_pass.sh
ADD modify_listen_addr.sh ./modify_listen_addr.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 5432
CMD ["/run.sh"]
