all: build run

build:
	mkdir -p ~/data/mariadb ~/data/wordpress
	docker compose -f ./src/docker-compose.yml build

run:
	docker compose -f ./src/docker-compose.yml up

rund:
	docker compose -f ./src/docker-compose.yml up -d

start:
	docker compose -f ./src/docker-compose.yml start

stop:
	docker compose -f ./src/docker-compose.yml stop

down:
	docker compose -f ./src/docker-compose.yml down

mariadb:
	docker compose -f ./src/docker-compose.yml build mariadb
	docker compose -f ./src/docker-compose.yml up -d mariadb

wordpress:
	docker compose -f ./src/docker-compose.yml build wordpress
	docker compose -f ./src/docker-compose.yml up -d wordpress

nginx:
	docker compose -f ./src/docker-compose.yml build nginx
	docker compose -f ./src/docker-compose.yml up -d nginx

exec:
	docker compose -f ./src/docker-compose.yml exec $(service) $(exec)
	
bonus:
	docker compose -f ./src/bonus/docker-compose.yml up

fclean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q) 2>/dev/null

vclean:
	sudo rm -rf ~/data/mariadb/ ~/data/wordpress

delete:
	docker system prune -af
