#!/bin/sh

docker kill course-actor-container http-actor-container student-actor-container
docker rm course-actor-container
docker rm student-actor-container
docker rm http-actor-container


docker run -it --rm -p 2552:2552 -d --name student-actor-container -v $PWD/config-student:/usr/lib/course-selection/config course-selection
docker run -it --rm -p 2553:2553 -d --name course-actor-container -v $PWD/config-course:/usr/lib/course-selection/config course-selection
docker run -it --rm -p 2554:2554 -p 7000:7000 -d --name http-actor-container -v $PWD/config-http:/usr/lib/course-selection/config course-selection
