#!/bin/sh

cp /home/cjr/Developing/course-selection/build/libs/course-selection-all.jar .

docker rmi course-selection
docker build -t course-selection .
