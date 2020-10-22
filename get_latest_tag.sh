#!/bin/bash

while test $# -gt 0; do
  case "$1" in
    -r|--repo)
      shift
      if test $# -gt 0; then
        repo=$1
      fi
      shift
      ;;
    -i|--image)
      shift
      if test $# -gt 0; then
        image=$1
      fi
      shift
      ;; 
    *)
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-r, --repo                 specify a repo to use"
      echo "-i, --image                 specify a image to use"
      exit 0
      ;;
    esac
done

if [ -z "$repo" ] 
  then
    echo ""; echo "Please specify an repo to use..."
    echo "-h, --help                show brief help"
    echo "-r, --repo                 specify a repo to use"
    echo "-i, --image                 specify a image to use"
    exit 1
  else 
    echo "Repo Entered: $repo"
 fi
 if [ -z "$image" ] 
  then
    echo ""; echo "Please specify an image to search for..."
    echo "-h, --help                show brief help"
    echo "-r, --repo                 specify a repo to use"
    echo "-i, --image                 specify a image to use"
    exit 1
  else 
    echo "Repo Entered: $image"
 fi

url="http://${repo}:5000/v2/${image}/tags/list"
image_list=$(curl -sX GET $url)
latest_tag=$(echo $image_list | jq -r .tags[] | sort -nr | head -n 1)

echo ""
echo "The latest tag for \"$image\" is $latest_tag!"
echo ""

