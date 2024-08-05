all: up

up:
	docker compose -f srcs/docker-compose.yml up -d

upnoc:
	docker compose -f srcs/docker-compose.yml build --no-cache
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

ps:
	docker compose -f srcs/docker-compose.yml ps -a

re: down up

clean:
	docker compose -f srcs/docker-compose.yml down --rmi all

