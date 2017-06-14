#!/bin/sh

srvip=10.222.130.19

curl "http://$srvip:8000/hello"
echo
curl "http://$srvip:8000/demo"
echo
curl "http://$srvip:8000/setlimit?cid=10&size=10"
echo
curl "http://$srvip:8000/table?sid=5"
echo
curl "http://$srvip:8000/take?sid=5&cid=5"
echo
curl "http://$srvip:8000/take?sid=5&cid=10"
echo
curl "http://$srvip:8000/take?sid=5&cid=10"
echo
curl "http://$srvip:8000/table?sid=5"
echo

curl "http://$srvip:8000/setlimit?cid=12&size=1"
echo
curl "http://$srvip:8000/take?sid=5&cid=12"
echo
curl "http://$srvip:8000/take?sid=6&cid=12"
echo

curl "http://$srvip:8000/quit?sid=5&cid=12"
echo
curl "http://$srvip:8000/quit?sid=5&cid=12"
echo
curl "http://$srvip:8000/table?sid=5"
echo
curl "http://$srvip:8000/take?sid=6&cid=12"
echo
curl "http://$srvip:8000/table?sid=6"
echo
