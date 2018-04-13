From python:3.6-jessie

ENV PROJECT=myproj \ 
    AUTHOR=acefei

RUN pip install sphinx sphinx_rtd_theme && apt update && apt install -y vim
EXPOSE 12500
VOLUME ["/data"]
WORKDIR /data

COPY entry_point.sh /opt/bin/
COPY tmpl/ /opt/bin/tmpl/

CMD ["/opt/bin/entry_point.sh"]
