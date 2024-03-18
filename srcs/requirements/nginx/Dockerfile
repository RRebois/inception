FROM debian:bullseye

# update packages and install nginx on container
RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx -y

# install openssl
RUN mkdir -p /etc/nginx/ssl && apt install openssl -y

# Creation de la clef et du certificat TSL (sans mdp -nodes)
# req -x509 outpus certificate instead of a certificate request
# C country/ST state or province/ L locality/ O organization name/ OU organization unit name/ CN common name
RUN openssl req -x509 -nodes -newkey rsa:2048 -out /etc/nginx/ssl/rrebois.crt -keyout \
    /etc/nginx/ssl/rrebois.key \
    -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=rrebois.42.fr/UID=rrebois"

COPY conf/nginx.conf /etc/nginx/sites-available/rrebois.42.fr.conf

RUN echo "include /etc/nginx/sites-available/rrebois.42.fr.conf;" > /etc/nginx/sites-enabled/rrebois.42.fr.conf;

EXPOSE 443

# CMD ["executable", "param1", "param1"] (exec form)
# -g (global), daemon off, is used to set nginx server to run in the foreground
CMD [ "nginx", "-g", "daemon off;"]