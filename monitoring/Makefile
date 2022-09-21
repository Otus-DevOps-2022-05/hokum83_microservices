#vars
COMPOSE=../docker/docker-compose-buggy.yml

.PHONY: build push up start down destroy stop restart ps
build:
	docker-compose -f $(COMPOSE) build $(c)
push:
	docker-compose -f $(COMPOSE) push $(c)
up:
	docker-compose -f $(COMPOSE) up -d $(c)
start:
	docker-compose -f $(COMPOSE) start $(c)
down:
	docker-compose -f $(COMPOSE) down $(c)
destroy:
	docker-compose -f $(COMPOSE) down -v $(c)
stop:
	docker-compose -f $(COMPOSE) stop $(c)
restart:
	docker-compose -f $(COMPOSE) stop $(c)
	docker-compose -f $(COMPOSE) up -d $(c)
ps:
	docker-compose -f $(COMPOSE) ps
