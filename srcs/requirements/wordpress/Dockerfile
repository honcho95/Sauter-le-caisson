FROM debian:buster

RUN apt-get update -yq
# update the debian image -q for quiet mode 

RUN apt install php-fpm -yq
# install php-fpm  
RUN apt-get -y install php-cli php-mysql php-curl php-gd php-intl
# install php-cli php-mysql php-curl php-gd php-intl  
EXPOSE 9000
# expose the port 9000 to the host machine
WORKDIR /var/www/
# set the working directory to the var/www directory
RUN apt-get update -yq  
# update the debian image 
RUN apt-get install wget -yq && apt-get install -yq php7.3 php-mysqli php-fpm
# update the debian image and install wget  install php7.3 php-mysqli php-fpm  

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# download the wp-cli.phar file 
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# make the wp-cli.phar file executable and move it to the usr/local/bin directory 
WORKDIR /
# set the working directory to the root directory
COPY ./conf/www.conf etc/php/7.3/fpm/pool.d


COPY ./conf/wp-config.php /var/www/wordpress/

COPY ./tools/entrypoint.sh /var/www/
COPY ./ /var/www/wordpress/


RUN chmod 777 /var/www/wordpress/wp-config.php
RUN chmod +x /var/www/entrypoint.sh

RUN  service php7.3-fpm start && service php7.3-fpm stop 
# stop the php7.3-fpm service 

ENTRYPOINT [ "sh" , "/var/www/entrypoint.sh" ] 
# set the entrypoint to the entrypoint.sh file