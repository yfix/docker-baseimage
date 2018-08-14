DOCKER_TAG := 'yfix/baseimage:18.04'

build:
	docker build -t $(DOCKER_TAG) .
push:
	docker push $(DOCKER_TAG)
restart: kill start
	docker-compose ps
start:
	docker-compose up -d --remove-orphans
kill:
	docker-compose kill && docker-compose rm -vf
logs:
	docker-compose logs -f
pull:
	docker-compose pull
