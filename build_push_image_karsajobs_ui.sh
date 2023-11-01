#!/bin/bash

#Membuat Docker image dari Dockerfile
docker build -t karsajobs-ui:latest .

# Mengubah nama image sesuai format Docker Hub
docker tag karsajobs-ui:latest dicodinglff/karsajobs-ui:latest

#Login to Docker Hub using the environment variable
echo $PASSWORD_DOCKER_HUB | docker login -u dicodinglff --password-stdin

# Mengunggah image ke Docker Hub
docker push dicodinglff/karsajobs-ui:latest
