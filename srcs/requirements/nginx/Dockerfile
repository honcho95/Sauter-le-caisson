FROM debian:buster

RUN apt-get update -yq
# update the debian image 

RUN apt-get install nginx -y
# install nginx

RUN apt-get install openssl -y
# install openssl 

RUN rm etc/nginx/sites-enabled/default
# Remove the default file from the sites-enabled directory
# For no problems with the wordpress container

EXPOSE 443
# expose the port 443 used for https to the host machine

WORKDIR /etc/nginx/
# change the working directory to the nginx directory	

RUN openssl req -x509 -newkey rsa:2048 -nodes -keyout tbaskhan.42.fr.key -out tbaskhan.42.fr.crt -days 365 \
	-subj "/C=FR/ST=France/L=Paris/O=42, Inc./OU=IT/CN=tbaskhan.42.fr"
# generate a self-signed certificate for the server using openssl and the subject name tbaskhan.42.fr 

WORKDIR /
# change the working directory to the root directory

COPY conf/nginx.conf /etc/nginx/sites-available/default
# copy the nginx.conf file to replace the default configuration

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ && rm -rf /var/www/html
# create a symbolic link to the default file in the sites-enabled directory and remove the html folder from the var/www directory

#Ces instructions permettent de configurer correctement Nginx dans l'image Docker en activant 
# le site par défaut et en supprimant le contenu du dossier 
#  qui n'est pas nécessaire pour la configuration de base de Nginx.

VOLUME "/var/www/wordpress"
# create a volume to the wordpress folder

ENTRYPOINT nginx -g 'daemon off;'
# start the nginx server in the foreground so that the container does not stop 
# after the server is started and the container is still running in the background 
# -g to working globally