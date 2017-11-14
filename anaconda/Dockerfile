From acefei/genesis

ENV ANACONDA_VER=5.0.1 \
    ANACONDA_PY_VER=2

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
 && curl https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda${ANACONDA_PY_VER}-${ANACONDA_VER}-Linux-x86_64.sh -o ~/anaconda.sh \
 && /bin/bash ~/anaconda.sh -b -p /opt/conda \
 && rm ~/anaconda.sh \
 && /opt/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ \
 && /opt/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ \
 && /opt/conda/bin/conda config --set show_channel_urls yes \
 && /opt/conda/bin/conda install jupyter -y --quiet

ENV PATH=/opt/conda/bin:$PATH \
# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
LANG=C.UTF-8

