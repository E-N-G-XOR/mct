#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    -t|--tag)
      shift
      if test $# -gt 0; then
        tag=$1
      fi
      shift
      ;; 
    *)
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-t, --tag                 specify an tag to use"
      exit 0
      ;;
    esac
done

if [ -z "$tag" ] 
  then
    echo ""; echo "tag options:"
    echo "-h, --help                show brief help"
    echo "-t, --tag                 specify an tag to use"
    exit 1
  else 
    echo "Tag Entered: $tag"
 fi

#build the image
docker build -t hello:$tag .

# tag docker images
docker tag hello:v1 localhost:5000/hello:$tag
docker tag hello:v1 localhost:5000/hello:latest

#push images to repo
docker push localhost:5000/hello:latest
docker push localhost:5000/hello:$tag