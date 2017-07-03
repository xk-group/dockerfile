#!/bin/sh

#hostname=$1
hostname=`ip a | grep 'eth.:' -A 4 | grep 'inet ' | sed -n 's/.*inet \(.*\)\/.*/\1/p'`

#mkdir -p config-student
#./example.conf.sh '["student"]' $hostname 2552 $seed 2552 $seed 2553 0 > config-student/example.conf
#mkdir -p config-course
#./example.conf.sh '["course"]' $hostname 2553 $seed 2552 $seed 2553 0 > config-course/example.conf
#mkdir -p config-http
#./example.conf.sh '["http"]' $hostname 2554 $seed 2552 $seed 2553 7000 > config-http/example.conf


mkdir -p config-main
./example.conf.sh '["course", "student", "http"]' $hostname 2552 $1 2552 $2 2552 7000 > config-main/example.conf
