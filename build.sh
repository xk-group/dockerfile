#!/bin/sh

git submodule update --init
cd course-selection
git checkout -- .
git clean -xdf
git checkout test
git pull --rebase
./gradlew clean shadowJar
cd ..

cp course-selection/build/libs/course-selection-all.jar .
cd course-selection
git clean -- .
git clean -xdf
cd ..

docker rmi course-selection
docker build -t course-selection .

rm -f course-selection-all.jar
