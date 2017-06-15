#!/bin/sh

#hostname=$1
hostname=`ip a | grep 'inet ' | grep -v '127.0.0.1' | sed -n 's/.*\(10.*\)\/.*/\1/p'`
seed=$1

#sed -i "s/tcp.hostname = \"\([^\"]*\)\"/tcp.hostname = \"$hostname\"/" config-course/example.conf
#sed -i "s/tcp.hostname = \"\([^\"]*\)\"/tcp.hostname = \"$hostname\"/" config-student/example.conf
#sed -i "s/tcp.hostname = \"\([^\"]*\)\"/tcp.hostname = \"$hostname\"/" config-http/example.conf

mkdir -p config-student
./example.conf.sh '["student"]' $hostname 2552 $seed 2552 $seed 2553 0 > config-student/example.conf
mkdir -p config-course
./example.conf.sh '["course"]' $hostname 2553 $seed 2552 $seed 2553 0 > config-course/example.conf
mkdir -p config-http
./example.conf.sh '["http"]' $hostname 2554 $seed 2552 $seed 2553 7000 > config-http/example.conf
