From acefei/python2

VOLUME /data

RUN pip --no-cache-dir install spiderkeeper \
                               scrapyd \
                               scrapy-redis \
    && apt-get update \
    && apt-get install -y supervisor \
    && apt-get clean


COPY scrapyd.conf  /etc/scrapyd/scrapyd.conf
COPY supervisord.conf /etc/supervisor/conf.d

# scrapyd port
EXPOSE 6800

# spiderkeeper port
EXPOSE 5000

# supervisord port
# EXPOSE 80

ENTRYPOINT ["supervisord"]
