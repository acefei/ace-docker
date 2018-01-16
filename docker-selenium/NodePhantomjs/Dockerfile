FROM selenium/node-base
MAINTAINER Acefei <acefei@163.com>

USER root

# PhantomJS
RUN apt-get update -y \
    && apt-get install bzip2 libfreetype6 libfontconfig1 libicu55 ttf-wqy-microhei -y \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* 

RUN wget https://raw.githubusercontent.com/prospress/phantomjs/2-1-1-hub-fix/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
    && tar -xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && rm phantomjs-2.1.1-linux-x86_64.tar.bz2 \ 
    && mv /phantomjs-2.1.1-linux-x86_64 /usr/local/phantomjs-2.1.1-linux-x86_64 \
    && ln -s /usr/local/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

# Scripts to run Selenium Node
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh

USER seluser
CMD ["/opt/bin/entry_point.sh"]
