# Dockerfiles of course-selection

## Build

```
./build.sh
```

Decide the seed-nodes ip address as `$seed`, and run
```
./sub $seed
```
this script will invoke `example.conf.sh`, and create three subdirectories, which contains the config of respective kind of actor.

## Running containers

Afterwards, run
```
./run.sh
```
three containers will start up, you can use `docker ps -a`, `docker stats`, and `docker inspect` to show the states of the containers.
A simple script `test.sh` can show if the containers are correctly running.


To kill and remove all these running containers, run
```
./kill.sh
```
## Deployment

The scripts `arch-deploy.sh` and `ubuntu-deploy.sh` can be used with pssh to do batch deployment on archlinux, and ubuntu 16.04. There may be some bugs in these scripts.
