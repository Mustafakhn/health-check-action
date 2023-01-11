#!/bin/bash

website=$1
version=$2
method=$3

if [[ "$version" != "none" && "$method" != "curl" ]]
then
  sudo apt-get install wget
  while [ "$status" != "0" ]; do
      sleep 5
      wget -S --no-cache --spider $website 2>&1 | grep HTTP/
      wget $website -q -O - | grep -Po $version
      status=$(echo $?)
  done
elif [[ "$version" != "none" ]]
then
  sudo apt-get install curl
  while [ "$status" != "0" ]; do
      sleep 5
      curl $website
      curl -H 'Cache-Control: no-cache, no-store' -v --silent $website 2>&1 | grep -Po $version
      status=$(echo $?)
  done
elif [[ "$method" != "curl" ]]
then
  sudo apt-get install wget
  while [ "$status" != "0" ]; do
      sleep 5
      wget -S --no-cache --spider $website 2>&1 | grep HTTP/
      wget $website -q -O -
      status=$(echo $?)
  done
else
  sudo apt-get install curl
  while [ "$status" != "0" ]; do
      sleep 5
      curl $website
      curl -H 'Cache-Control: no-cache, no-store' -v --silent $website 2>&1
      status=$(echo $?)
  done
fi
