#!/bin/bash
#image name dan image tag versi1
image_name="dicodinglff/item-app"
image_tag="v1"
# Restart policy: always
restart: always

#Login terlebih dahulu di docker desktop 
docker build -t "dicodinglffn/item-app:v1" .
#upload kontainer ke docker hub
docker push "dicodinglff/item-app:v1"

docker images