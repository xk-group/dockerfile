#!/bin/sh

apt install docker.io -y
cat <<EOF > docker.service
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target docker.socket firewalld.service
Wants=network-online.target
Requires=docker.socket

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd://
ExecReload=/bin/kill -s HUP \$MAINPID
LimitNOFILE=1048576
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
#TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
# restart the docker process if it exits prematurely
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s

[Install]
WantedBy=multi-user.target

EOF

mkdir /usr/lib/systemd/system
cp docker.service /usr/lib/systemd/system/
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

./sub.sh 121.201.68.234
./run.sh

