#!/bin/sh

#cp /home/cjr/Developing/course-selection/build/libs/course-selection-all.jar .
cp course-selection-all.jar student-actor
cp course-selection-all.jar course-actor
cp course-selection-all.jar http-actor

docker rmi student-actor
docker rmi course-actor
docker rmi http-actor

docker build -t student-actor student-actor
docker build -t course-actor course-actor
docker build -t http-actor http-actor
