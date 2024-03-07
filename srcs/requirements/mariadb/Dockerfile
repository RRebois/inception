FROM debian:bullseye

RUN apt update && apt upgrade && apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# CMD mariadb.sh
#COPY ./tools/mariadb.sh /

#RUN chmod +x /mariadb.sh
#ENTRYPOINT ["/mariadb.sh"]
# ADD tools/mariadb.sh /root/mariadb.sh
#CMD ["mariadb_init.sh"]
#CMD [ "mariadb", "-g", "daemon off;"]


RUN service mysql start;
RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
RUN mysql -e "CREATE USER IF NOT EXITS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
RUN mysql -e "FLUSH PRIVILEGED;"
RUN mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
RUN exec mysql_safe