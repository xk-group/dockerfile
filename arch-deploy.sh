#!/bin/sh

yes | sudo pacman -S docker
sudo gpasswd -a concurrency docker
newgrp docker
# stage two, delete above commands
sudo systemctl start docker
sudo systemctl enable docker

yes | sudo pacman -S wget

wget http://121.201.58.220:4080/course-selection.tar -c

docker load -i course-selection.tar

git clone http://github.com/xk-group/dockerfile.git
cd dockerfile
git checkout single
ipaddr=`ip a | grep 'inet ' | grep -v '127.0.0.1' | sed -n 's/.*\(10.*\)\/.*/\1/p'`

./sub.sh $ipaddr
./run.sh
