FROM debian:bullseye

#docker build ./ -t nginx
#docker run -it nginx

# update packages and install nginx on container
RUN apt update && apt upgrade && apt install nginx -y

# install openssl
RUN mkdir -p /etc/nginx/ssl && apt install openssl -y

# Creation de la clef et du certificat TSL (sans mdp -nodes)
# req -x509 outpus certificate instead of a certificate request
# C country/ST state or province/ L locality/ O organization name/ OU organization unit name/ CN common name
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/rrebois.crt -keyout \
    /etc/nginx/ssl/rrebois.key \
    -subj "/C=FR/ST=RA/L=Lyon/O=42/OU=42/CN=rrebois.42.fr/UID=rrebois"

# dossier pour stocker les fichiers de config de nginx
RUN mkdir -p /var/run/nginx

# remplace le fichier config de nginx par le notre
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
# change owner && -R modifie de maniere recursive l'appartenance des fichiers et leur contenu
RUN chown -R www-data:www-data /var/www/html

# CMD ["executable", "param1", "param1"] (exec form)
# -g (global), daemon off, is used to set nginx server to run in the foreground
CMD [ "nginx", "-g", "daemon off;"]