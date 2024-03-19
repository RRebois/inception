NAME	=	up

all			:	${NAME}

${NAME}		:
				mkdir -p /home/rrebois/data/mariadb /home/rrebois/data/wordpress
				docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up

down		:
				docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

restart		:
				docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env restart

stop-all	:
				${MAKE} down
				- docker stop $$(docker ps -qa)
				- docker rm $$(docker ps -qa)
				- docker rmi -f $$(docker images -qa)
				- docker volume rm $$(docker volume ls -q)
				- docker network rm $$(docker network ls -q) 2>/dev/null
				sudo rm -rf /home/rrebois/data/mariadb /home/rrebois/data/wordpress

.PHONY		:	all stop-all down restart