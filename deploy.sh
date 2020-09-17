#!/bin/sh
docker kill $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)
docker pull thangqt/app:latest
docker run -d --name webapp -p 8080:8080 -d thangqt/app 
