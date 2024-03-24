all:
	@mkdir -p $(HOME)/fsoymaz/data/wordpress
	@mkdir -p $(HOME)/fsoymaz/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(HOME)/fsoymaz/data/wordpress
	rm -rf $(HOME)/fsoymaz/data/mariadb

.PHONY: all re down clean
