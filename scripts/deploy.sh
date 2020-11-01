#!/bin/bash

# disable firewalld
systemctl stop firewalld
systemctl disable firewalld

# start doker deamon if not exist.
sudo systemctl start docker

# pull a docker image from docker hub
docker pull oppenheimli/shareed_server:v1.1

# run the container
docker run -d -it --network=host  --cap-add NET_ADMIN --name shareed_server oppenheimli/shareed_server:v1.1 /bin/bash
