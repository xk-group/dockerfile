#!/bin/sh

apt install docker.io -y
apt install wget -y
wget http://121.201.58.220:4080/docker.service -c
mkdir /usr/lib/systemd/system
cp docker.service /usr/lib/systemd/system/
sudo systemctl start docker
sudo systemctl enable docker

wget http://121.201.58.220:4080/course-selection-ubuntu.tar -c

docker load -i course-selection.tar

git clone http://github.com/xk-group/dockerfile.git
cd dockerfile
git checkout single-ubuntu
ipaddr=`ip a | grep 'inet ' | grep -v '127.0.0.1' | sed -n 's/.*\(10.*\)\/.*/\1/p'`

./sub.sh $ipaddr
./run.sh

