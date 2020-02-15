FROM ubuntu:xenial

SHELL [ "/bin/bash", "-c" ]

# Install apt packages
RUN apt-get update -qq && \
  apt-get install -y locales fakeroot debhelper libffi-dev git attr \
  libssl-dev python-dev python-pip wget openjdk-8-jdk zip devscripts \
  dh-systemd libmysqlclient-dev dh-virtualenv dh-make libc6-i386 lib32z1 \
  zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
  libbz2-dev libexpat1-dev liblzma-dev libffi-dev uuid-dev

# Build Python 3 from source.
RUN wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz && \
  tar xzvf Python-3.6.9.tgz && \
  cd Python-3.6.9 && \
  ./configure --enable-shared --enable-ipv6 --prefix=/usr/local \
    LDFLAGS="-Wl,-rpath /usr/local/lib" && \
  make && \
  make altinstall

# Setup new python and pip
RUN echo "alias python='/Python-3.6.9/python'" >> ~/.bashrc
RUN echo "alias pip='/Python-3.6.9/python -m pip'" >> ~/.bashrc
RUN source ~/.bashrc
RUN pip install --upgrade pip
