git clone https://github.com/google/grr
cd grr/
sudo apt-get install virtualenv -y
virtualenv ~/.virtualenv/GRR --python=python3
source ~/.virtualenv/GRR/bin/activate
pip install --upgrade pip wheel setuptools six
pip install nodeenv
nodeenv -p --prebuilt
source ~/.virtualenv/GRR/bin/activate
sudo apt-get install libssl-dev python-dev python-pip wget openjdk-8-jdk zip dh-systemd libmysqlclient-dev -y
pip install -e grr/proto
pip install -e grr/core
pip install -e grr/client
pip install -e api_client/python
pip install -e grr/client_builder
pip install -e grr/server/[mysqldatastore]
pip install -e colab
pip install -e grr/test
