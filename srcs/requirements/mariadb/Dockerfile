FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

ARG DATABASE
ARG USER
ARG ROOT_PASSWORD
ARG PASSWORD

#Table creattion after starting the mariadb service, then creation of a user to that will be able to use it
RUN service mariadb start \
&& mariadb -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};" \
&& mariadb -e "CREATE USER IF NOT EXISTS '${USER}'@'localhost' IDENTIFIED BY '${PASSWORD}';" \
&& mariadb -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${USER}'@'%' IDENTIFIED BY '${PASSWORD}';" \
&& mariadb -e "FLUSH PRIVILEGES;"

CMD ["mariadbd", "--bind-address=0.0.0.0"]