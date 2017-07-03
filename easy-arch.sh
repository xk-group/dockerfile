#!/bin/bash

sudo pacman -S git docker --noconfirm
sudo gpasswd -a $USER docker
sudo systemctl enable docker
sudo systemctl start docker

rm -rf dockerfile
git clone https://github.com/xk-group/dockerfile.git
cd dockerfile
git checkout master

run_as_docker() {
    docker rmi crazyboycjr/course-selection
    docker pull crazyboycjr/course-selection
    docker tag crazyboycjr/course-selection course-selection

    ./sub.sh 172.104.99.30 172.104.127.88
    ./run.sh
}
export -f run_as_docker
sg docker run_as_docker

