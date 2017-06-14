#!/bin/sh

git submodule update --init
cd course-selection
git checkout test
./gradlew clean shadowJar
cd ..

cp course-selection/build/libs/course-selection-all.jar .

docker rmi course-selection
docker build -t course-selection .
