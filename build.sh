#!/bin/bash
docker build -t react-appimg .

docker-compose down || true

docker-compose up -d
