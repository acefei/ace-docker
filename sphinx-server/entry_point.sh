#!/bin/sh

mkdir -p /data/sphinx && cd /data/sphinx

# init sphinx configuration
opts="-q -p $PROJECT -a $AUTHOR -t /opt/bin/tmpl"

if [ -n "$RELEASE" ]; then 
    opts="$opts -r $RELEASE "
fi
sphinx-quickstart $opts

# API_PATH indicates your python source code path
API_PATH=/data/api
sphinx-apidoc -o docs/source  $API_PATH

make html

cd _build/html
python3 -m http.server 12500
