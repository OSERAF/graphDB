#!/bin/sh

unzip databases 
chown -R oseraf:oseraf databases

mv databases /opt/oseraf/data/

docker build -t oseraf/orientdb .
