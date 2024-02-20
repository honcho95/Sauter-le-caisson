FROM debian:buster
# 

RUN apt-get update -yq
# update the debian image ; -q = quiet mode

RUN apt-get upgrade -y
# upgrade the packages 

RUN apt-get install -y mariadb-server
# install mariadb-server   

EXPOSE 3306
# expose the port 3306 to the host machine 

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./ /var/www/
# copy the conf file to the mariadb.conf.d folder and copy the whole folder to the var/www folder

RUN service mysql start 
#start the mysql server 

COPY ./tools/entrypoint.sh /entrypoint.sh
# copy the entrypoint.sh file to the root directory 

VOLUME  "/var/lib/mysql"
# create a volume to the mysql folder 

ENTRYPOINT  [ "sh", "entrypoint.sh"]
# start the entrypoint.sh file in the foreground so that the container does not stop 