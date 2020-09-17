#!/bin/sh
docker pull thangqt/app:latest
docker run -d --name webapp -p 8080:8080 -d thangqt/app 
