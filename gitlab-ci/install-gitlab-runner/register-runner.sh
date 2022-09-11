#!/usr/bin/bash
docker-compose up -d

docker-compose exec gitlab-runner-container \
   gitlab-runner register \
   --non-interactive \
   --url http://your-url/ \
   --registration-token YoUrToKeN \
   --executor docker \
   --description "Test Runner 1" \
   --docker-image "docker:stable" \
   --docker-volumes /var/run/docker.sock:/var/run/docker.sock
