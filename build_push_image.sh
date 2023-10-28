#!/bin/bash
#image name dan image tag versi1
image_name="item-app"
image_tag="v1"

#Membuat Docker image dari Dockerfile
docker build -t item-app:v1 .

#Set environment variable for Docker Hub password
export PASSWORD_DOCKER_HUB=webprogramming
#Login to Docker Hub using the environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u dicodinglff --password-stdin


# Mengubah nama image sesuai format Docker Hub
docker tag item-app:v1 dicodinglff/item-app:v1

# Mengunggah image ke Docker Hub
docker push dicodinglff/item-app:v1

#menampilkan daftar images
docker images