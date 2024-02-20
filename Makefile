SRC 			:= ./srcs
DOCKER			:= sudo docker
COMPOSE 		:= cd srcs / && sudo docker-compose
DATA_PATH 		:= /home/tbaskhan/data

all		:	build
		sudo mkdir -p $(DATA_PATH)
		sudo mkdir -p $(DATA_PATH)/wordpress
		sudo mkdir -p $(DATA_PATH)/mariadb
ifeq ("$(wildcard .setup)","")
	@ printf "[\033[0;32m+\033[m]] Applying DNS redirection\n]"
	sudo chmod 777 /etc/hosts
	@sudo sed -i "1i\127.0.0.1\tbaskhan.42.fr" /etc/hosts
	touch .setup
endif
		$(COMPOSE) up -d

build	:
		$(COMPOSE) build

down	:
		$(COMPOSE) down

clean	:
		$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
		$(DOCKER) system prune --volumes --all --force
		sudo rm -rf $(DATA_PATH)
		@sudo sed -i "/127.0.0.1\tbaskhan.42.fr/d" /etc/hosts
		$(DOCKER) network prune --force
		$(DOCKER) volume prune --force
		$(DOCKER) image prune --force
		rm .setup

re		:	fclean all
.PHONY	: all build down clean fclean re