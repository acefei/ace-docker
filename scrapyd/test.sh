#!/bin/sh
#docker run -it acefei/scrapyd /bin/bash
docker run -p 6800:6800 -p 5000:5000 -v /tmp/scrapyd-data:/data acefei/scrapyd 
