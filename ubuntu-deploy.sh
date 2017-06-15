#!/bin/sh

apt install docker.io -y
apt install wget -y
wget http://121.201.58.220:4080/docker.service -c
mkdir /usr/lib/systemd/system
cp docker.service /usr/lib/systemd/system/
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

./sub.sh 121.201.68.234
./run.sh

