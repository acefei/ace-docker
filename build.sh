#!/bin/sh

c_dir=$(cd $(dirname "$0") && pwd)
image_name=${c_dir##*/}

echo "===> Start build acefei/$image_name in $c_dir"
docker build -t "acefei/$image_name" $c_dir
