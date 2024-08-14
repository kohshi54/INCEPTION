all: up

up:
	#mkdir -p ~/data/wp_data # priviledge differ in host and container
	#mkdir -p ~/data/db_data
	docker compose -f srcs/docker-compose.yml up -d

upnoc:
	#mkdir -p ~/data/wp_data
	#mkdir -p ~/data/db_data
	docker compose -f srcs/docker-compose.yml build --no-cache
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

ps:
	docker compose -f srcs/docker-compose.yml ps -a

re: down up

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all
	docker system prune -f
	docker volume rm $$(docker volume ls -q)
	rm -rf ~/data/wp_data/*
	rm -rf ~/data/db_data/*

