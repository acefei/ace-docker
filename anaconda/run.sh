port=${1:-8888}
docker run -i -t -d -p $port:$port continuumio/anaconda /bin/bash -c "mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=$port --no-browser --NotebookApp.token=''"
# for root user
#docker run -i -t -d -p $port:$port continuumio/anaconda /bin/bash -c "mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=$port --no-browser --NotebookApp.token='' --allow-root"
