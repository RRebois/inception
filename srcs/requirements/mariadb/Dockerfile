FROM debian:bullseye

RUN apt update && apt upgrade && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


#COPY mariadb_init.sh /usr/local/bin/

#RUN chmod +x /usr/local/bin/mariadb_init.sh
# ADD tools/mariadb.sh /root/mariadb.sh
#CMD ["mariadb_init.sh"]
# CMD [./tools/mariadb.sh]