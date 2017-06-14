#!/bin/sh

seednode=$1

sed -i "s/CourseSelectSystem@\([^:]*\)/CourseSelectSystem@$seednode/" config-course/example.conf
sed -i "s/CourseSelectSystem@\([^:]*\)/CourseSelectSystem@$seednode/" config-student/example.conf
sed -i "s/CourseSelectSystem@\([^:]*\)/CourseSelectSystem@$seednode/" config-http/example.conf
