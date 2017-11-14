#!/bin/sh
# Set vm.max_map_count in /etc/sysctl.conf on the host itself, 
# so that elasticsearch does not attempt to do that from inside the docker container.
sudo sysctl -w vm.max_map_count=262144

docker run -itd -p 9200:9200 -p 9300:9300 \
    -v /tmp/es-data:/usr/share/elasticsearch/data \
    -v $PWD/config:/usr/share/elasticsearch/config \
    acefei/elasticsearch  


sleep 10
curl -X GET 172.17.0.2:9200
