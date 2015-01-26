#!/bin/sh

sudo docker run --name orientdb -d -v /opt/oseraf/graphDB/orientdb-docker/config:/opt/oseraf/orientdb/config -v /opt/oseraf/data/databases:/opt/oseraf/orientdb/databases -p 80:80 -p 2424:2424 -p 2480:2480 oseraf/orientdb 

