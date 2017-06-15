#!/bin/sh

sudo pacman -S wget --noconfirm
sudo pacman -S docker --noconfirm
sudo gpasswd -a concurrency docker
newgrp docker
# stage 2, delete above commands
sudo systemctl start docker
sudo systemctl enable docker

wget http://121.201.58.220:4080/course-selection.tar -c

docker kill student-actor-container course-actor-container http-actor-container
docker rm student-actor-container course-actor-container http-actor-container

docker rmi course-selection
docker load -i course-selection.tar

rm -rf dockerfile
git clone http://github.com/xk-group/dockerfile.git
cd dockerfile
git checkout single
#ipaddr=`ip a | grep 'inet ' | grep -v '127.0.0.1' | sed -n 's/.*\(10.*\)\/.*/\1/p'`

./sub.sh 10.131.245.65
./run.sh

