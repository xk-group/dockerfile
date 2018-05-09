# Dockerfiles of course-selection

## Requirements
+ Docker
+ git
## Build
```
./build.sh
```
## Generate configs
```
./sub.sh <listen_ip> <seed1_ip> <seed2_ip>
```
## Run
```
./run.sh
```
You must run the programs on the seed nodes first.
## Generating configs manually
```
./example.conf.sh <role_list_in_typesafe_config_format> <listen_ip> <listen_port> <seed1_ip> <seed1_port> <seed2_ip> <seed2_port> <http_port>
```
Save your output to config file
## Run manually
```
java -cp path/to/course-selection-all.jar -Dconfig.file=path/to/example.conf moe.taiho.course_selection.cluster.ClusterMain
```

# Old readme below, for reference only
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

The scripts `arch-deploy.sh` and `ubuntu-deploy.sh` can be used with pssh to do batch deployment on archlinux, and ubuntu 16.04. In order to successfully use these scripts, you must read the script, and make modification accordingly.
