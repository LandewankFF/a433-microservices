#!/bin/bash
#image name dan image tag versi1
image_name=item-app
image_tag="v1"

# Membuat Docker image dari Dockerfile
docker build -t item-app:v1 .

# Restart policy: always
restart: always

# Mengubah nama image sesuai format Docker Hub
docker tag item-app:v1 dicodinglff/proyek-pertama:v1

# Mengunggah image ke Docker Hub
docker push dicodinglff/proyek-pertama:v1

#menampilkan daftar images
docker images