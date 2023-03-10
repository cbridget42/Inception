
.PHONY: all build start stop clean fclean redis

all:
	srcs/requirements/wordpress/tools/make_d.sh
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	srcs/requirements/wordpress/tools/make_d.sh
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env build

down:
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

redis:
	docker exec -it redis redis-cli monitor

re: down
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)

fclean: down
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)
	sudo rm -rf ~/data