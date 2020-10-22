#!/bin/bash
tag=$(git log -1 --pretty=format:%h) 

echo "Hash Tag : $tag"

#build the image
docker build -t hello:$tag .

# tag docker images
docker tag hello:v1 localhost:5000/hello:$tag
docker tag hello:v1 localhost:5000/hello:latest

#push images to repo
docker push localhost:5000/hello:latest
docker push localhost:5000/hello:$tag