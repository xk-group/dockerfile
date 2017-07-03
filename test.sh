#!/bin/sh

srvip=127.0.0.1

curl "http://$srvip:7000/hello"
echo
curl -X POST "http://$srvip:7000/demo"
echo
curl -X POST "http://$srvip:7000/setlimit?cid=10&size=10"
echo
curl -X POST "http://$srvip:7000/table?sid=5"
echo
curl -X POST "http://$srvip:7000/take?sid=5&cid=5"
echo
curl -X POST "http://$srvip:7000/take?sid=5&cid=10"
echo
curl -X POST "http://$srvip:7000/take?sid=5&cid=10"
echo
curl -X POST "http://$srvip:7000/table?sid=5"
echo

curl -X POST "http://$srvip:7000/setlimit?cid=12&size=1"
echo
curl -X POST "http://$srvip:7000/take?sid=5&cid=12"
echo
curl -X POST "http://$srvip:7000/take?sid=6&cid=12"
echo

curl -X POST "http://$srvip:7000/quit?sid=5&cid=12"
echo
curl -X POST "http://$srvip:7000/quit?sid=5&cid=12"
echo
curl -X POST "http://$srvip:7000/table?sid=5"
echo
curl -X POST "http://$srvip:7000/take?sid=6&cid=12"
echo
curl -X POST "http://$srvip:7000/table?sid=6"
echo
