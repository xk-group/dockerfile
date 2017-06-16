#!/bin/sh

mkdir -p course-selection
git submodule update --init
cd course-selection
git checkout -- .
git clean -xdf
git checkout test
./gradlew clean shadowJar
cd ..

cp course-selection/build/libs/course-selection-all.jar .
rm -rf course-selection

docker rmi course-selection
docker build -t course-selection .

rm -f course-selection-all.jar
