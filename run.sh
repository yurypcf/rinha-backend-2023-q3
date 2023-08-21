#!/bin/sh

docker build -t rinha_api:latest . --no-cache
docker run --rm -p 3000:3000 --env-file ./.env rinha_api:latest  
