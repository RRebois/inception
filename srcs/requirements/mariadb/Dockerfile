FROM debian:bullseye

RUN apt-get update && apt-get upgrade && apt-get install mariadb-server -y

COPY conf/mariadb.conf /etc/mysql/mariadb.cnf.d/50-server.cnf

ARG DATABASE
ARG USER
ARG ROOT_PASSWORD
ARG PASSWORD

ENV DATABASE=mariadb
ENV USER=rrebois
ENV ROOT_PASSWORD=inceptionroot
ENV PASSWORD=inception

RUN service mariadb start \
&& mariadb -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};" \
&& mariadb -e "CREATE USER IF NOT EXISTS '${USER}'@'localhost' IDENTIFIED BY '${PASSWORD}';" \
&& mariadb -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'%' IDENTIFIED BY '${PASSWORD}';" \
&& mariadb -e "FLUSH PRIVILEGES;"
# && mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';" \
# && mariadb-admin -u root -p$ROOT_PASSWORD shutdown
# RUN exec mysql_safe

CMD ["mysqld_safe", "bind-address=0.0.0.0"]
# CMD ["mariadb", "bind-address=0.0.0.0"]