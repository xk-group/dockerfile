#!/bin/sh

hostname=$1

sed -i "s/tcp.hostname = \"\([^\"]\+\)\"/tcp.hostname = \"$hostname\"/" config-course/example.conf
sed -i "s/tcp.hostname = \"\([^\"]\+\)\"/tcp.hostname = \"$hostname\"/" config-student/example.conf
sed -i "s/tcp.hostname = \"\([^\"]\+\)\"/tcp.hostname = \"$hostname\"/" config-http/example.conf
