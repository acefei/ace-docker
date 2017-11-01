From acefei/python2

WORKDIR /data

COPY requirements.txt /tmp/
COPY scrapyd.conf  /etc/scrapyd/
COPY supervisord.conf /etc/supervisor/conf.d/

RUN pip --no-cache-dir install -r /tmp/requirements.txt \
    && apt-get update \
    && apt-get install -y supervisor \
    && apt-get clean

# scrapyd port
EXPOSE 6800

# spiderkeeper port
EXPOSE 5000

# supervisord port
# EXPOSE 80

# share logs 
VOLUME /data

ENTRYPOINT ["supervisord"]
