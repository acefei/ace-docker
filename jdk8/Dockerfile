FROM acefei/genesis

RUN set -x \
    && mkdir -p /opt \
    && cd /opt       \
    && export JAVA_UPDATE="144" \
    && export JAVA_BUILD="01"   \
    && export RANDOM_NUM="090f390dda5b47b9b721c7dfaa008135" \

    && export JAVA_URL="http://download.oracle.com/otn-pub/java/jdk/8u${JAVA_UPDATE}-b${JAVA_BUILD}/${RANDOM_NUM}" \
    && export JAVA_TGZ="jdk-8u${JAVA_UPDATE}-linux-x64.tar.gz"                                \
    && curl -v -O -L -b oraclelicense=accept-securebackup-cookie ${JAVA_URL}/${JAVA_TGZ} \
    && tar -xzf ${JAVA_TGZ}              \
    && mv jdk1.8.0_${JAVA_UPDATE} jdk1.8 \
    && chown -R root:root jdk1.8         \
    && rm ${JAVA_TGZ}

ENV JAVA_HOME=/opt/jdk1.8 PATH=/opt/jdk1.8/bin:${PATH}

