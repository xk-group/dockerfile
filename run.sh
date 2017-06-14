#!/bin/sh

docker kill course-actor-container http-actor-container student-actor-container
docker rm course-actor-container
docker rm student-actor-container
docker rm http-actor-container

docker run -it --rm -p 2552:2552 -d --name student-actor-container student-actor
docker run -it --rm -p 2553:2553 -d --name course-actor-container course-actor
docker run -it --rm -p 8000:8000 -d --name http-actor-container http-actor
