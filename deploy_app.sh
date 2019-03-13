#!/bin/bash
sudo apt update && sudo apt install docker docker-compose
sudo rm -rf app/
git clone https://github.com/AudelDiaz/acme_bank_docker_test.git app
cd app
docker-compose pull
docker-compose build
docker-compose up -d