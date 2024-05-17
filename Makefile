all: build run

build:
	docker compose -f ./src/docker-compose.yml build

run:
	docker compose -f ./src/docker-compose.yml up

mariadb:
	docker compose -f ./src/docker-compose.yml build mariadb
	docker compose -f ./src/docker-compose.yml up mariadb

wordpress:
	docker compose -f ./src/docker-compose.yml build wordpress
	docker compose -f ./src/docker-compose.yml up wordpress

nginx:
	docker compose -f ./src/docker-compose.yml build nginx
	docker compose -f ./src/docker-compose.yml up nginx

bonus:
	docker compose -f ./src/bonus/docker-compose.yml up

fclean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q) 2>/dev/null

delete:
	docker system prune -af
