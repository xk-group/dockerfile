#!/bin/bash

main() {
    sudo pacman -S git docker --noconfirm --needed
    sudo gpasswd -a $USER docker
    sudo systemctl enable docker
    sudo systemctl start docker

    rm -rf dockerfile
    git clone https://github.com/xk-group/dockerfile.git
    cd dockerfile
    git checkout master

    export -f run_as_docker
    sg docker run_as_docker
}

run_as_docker() {
    docker rmi crazyboycjr/course-selection
    #docker pull crazyboycjr/course-selection
    #docker tag crazyboycjr/course-selection course-selection
    curl https://dl.dropboxusercontent.com/s/wv3xvq8076wsqe3/course-selection.tar.xz | xz -d -c - | docker load
}

main
