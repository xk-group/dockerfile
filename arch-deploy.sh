#!/bin/sh

sudo pacman -S docker --noconfirm
sudo gpasswd -a concurrency docker
newgrp docker
# stage 2, delete above commands
sudo systemctl start docker
sudo systemctl enable docker

docker kill student-actor-container course-actor-container http-actor-container
docker rm student-actor-container course-actor-container http-actor-container

docker rmi crazyboycjr/course-selection
docker pull crazyboycjr/course-selection
docker tag crazyboycjr/course-selection course-selection

rm -rf dockerfile
git clone http://github.com/xk-group/dockerfile.git
cd dockerfile
git checkout master
#ipaddr=`ip a | grep 'inet ' | grep -v '127.0.0.1' | sed -n 's/.*\(10.*\)\/.*/\1/p'`

./sub.sh 10.131.245.65
./run.sh

