#!/bin/sh

docker kill course-actor-container student-actor-container http-actor-container
docker rm course-actor-container student-actor-container http-actor-container
