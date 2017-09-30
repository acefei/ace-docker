FROM acefei/jdk8

# Refer to https://github.com/docker-library/elasticsearch
ENV ES_VERSION 5.6.2
ENV ES_HOME /usr/share/elasticsearch
ENV PATH $ES_HOME/bin:$PATH

RUN set -x \
    && wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-transport-https \
    && echo 'deb https://artifacts.elastic.co/packages/5.x/apt stable main' > /etc/apt/sources.list.d/elasticsearch.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends "elasticsearch=$ES_VERSION" \
    && rm -rf /var/lib/apt/lists/* \
    && cd $ES_HOME \
    && for path in \
        ./data \
        ./logs \
        ./config \
    ; do \
        mkdir -p "$path"; \
    done \
    && chown -R elasticsearch:elasticsearch $ES_HOME 

VOLUME $ES_HOME/config
VOLUME $ES_HOME/data

COPY docker-entrypoint.sh /

EXPOSE 9200 9300
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["elasticsearch"]
