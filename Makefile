
build:
	docker-compose -f ./srcs/docker-compose.yml build
	mkdir -p srcs/data/mariadb
	mkdir -p srcs/data/wordpress

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

restart:
	make down
	make up

logs:	
	cd ./srcs  docker-compose logs -f

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf srcs/data/mariadb/ *\
	rm -rf srcs/data/wordpress/ *\
.PHONY: build up down restart clean	