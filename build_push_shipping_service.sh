#!/bin/bash

# Membuat Docker image dari Dockerfile
docker build -t shipping-service:v1 .

# Menampilkan daftar images
docker images

# Mengubah nama image sesuai format Docker Hub
docker tag shipping-service:v1 dicodinglff/shipping-service:v1

# Login to Docker Hub using the environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u dicodinglff --password-stdin

# Mengunggah image ke Docker Hub
docker push dicodinglff/shipping-service:v1
