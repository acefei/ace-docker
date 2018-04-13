#!/bin/sh
debug=$1

if [ -n $debug ]; then
   suffix=/bin/bash 
else
   suffix=''
fi

docker run -it -p 12500:12500 -v ./data:/data acefei/sphinx-server $suffix
