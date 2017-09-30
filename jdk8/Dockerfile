FROM acefei/genesis

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre
ENV PATH=${JAVA_HOME}/bin:${PATH}

RUN set -x \
    && echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list \
    && apt-get update \
    && apt-get install -y -t jessie-backports openjdk-8-jre-headless ca-certificates-java \
    && rm -rf /var/lib/apt/lists/*
