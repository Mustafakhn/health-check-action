#!/bin/bash

if [[ "$2" != "none" && "$3" != "curl" ]]
then
  while [ "$status" != "0" ]; do
      sleep 5
      wget -S --spider $1 2>&1 | grep HTTP/
      wget $1 -q -O - | grep -Po $2
      status=$(echo $?)
  done
elif [[ "$2" != "none" ]]
then
  while [ "$status" != "0" ]; do
      sleep 5
      curl $1
      curl -v --silent $1 2>&1 | grep -Po $2
      status=$(echo $?)
  done
elif [[ "$3" != "curl" ]]
then
  while [ "$status" != "0" ]; do
      sleep 5
      wget -S --spider $1 2>&1 | grep HTTP/
      wget $1 -q -O -
      status=$(echo $?)
  done
else
  while [ "$status" != "0" ]; do
      sleep 5
      curl $1
      curl -v --silent $1 2>&1
      status=$(echo $?)
  done
fi
