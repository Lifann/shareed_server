#!/bin/bash

# pull a docker image from docker hub
docker pull oppenheimli/shareed_server:v1.0

# run the container
docker run -d -it --network=host  --name shareed_server oppenheimli/shareed_server:v1.0 /bin/bash
