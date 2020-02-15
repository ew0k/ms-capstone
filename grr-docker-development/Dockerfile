FROM python:3.8-buster

SHELL [ "/bin/bash", "-c" ]
WORKDIR /root/

RUN python -V
RUN pip -V

# Step 1
# RUN git clone https://github.com/google/grr && cd grr/

# Step 2
RUN apt-get update
RUN apt-get install -y virtualenv \
  && virtualenv ~/.virtualenv/GRR --python=python \
  && source ~/.virtualenv/GRR/bin/activate \
  && pip install --upgrade pip wheel setuptools six

# Step 3
RUN pip install nodeenv \
  && nodeenv -p --prebuilt \
  && source ~/.virtualenv/GRR/bin/activate

# Step 4
RUN sudo apt-get install -y libssl-dev python-dev python-pip wget openjdk-8-jdk zip dh-systemd libmysqlclient-dev

# Step 6
RUN pip install -e ./grr/proto \
  && pip install -e ./api_client/python \
  && pip install -e ./grr/core \
  && pip install -e ./grr/client \ 
  && pip install -e ./grr/server/[mysqldatastore] \
  && pip install -e ./grr/test

# Step 7
RUN pip install --no-cache-dir -f https://storage.googleapis.com/releases.grr-response.com/index.html grr-response-templates

# Step 8
RUN apt-get install -y mysql-server

