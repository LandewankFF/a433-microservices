#!/bin/bash

#Membuat Docker image dari Dockerfile
docker build -t item-app:v1 .

#menampilkan daftar images
docker images

# Mengubah nama image sesuai format Docker Hub
docker tag item-app:v1 dicodinglff/item-app:v1

#Login to Docker Hub using the environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u dicodinglff --password-stdin

# Mengunggah image ke Docker Hub
docker push dicodinglff/item-app:v1
