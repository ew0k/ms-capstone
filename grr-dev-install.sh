# Step 1
git clone https://github.com/google/grr
cd grr/

# Step 2
apt-get install virtualenv -y
virtualenv ~/.virtualenv/GRR --python=python3
source ~/.virtualenv/GRR/bin/activate
pip install --upgrade pip wheel setuptools six

# Step 3
pip install nodeenv
nodeenv -p --prebuilt
source ~/.virtualenv/GRR/bin/activate

# Step 4
apt-get install libssl-dev python-dev python-pip wget openjdk-8-jdk zip dh-systemd libmysqlclient-dev -y

# Step 5
pip install -e grr/proto
pip install -e grr/core
pip install -e grr/client
pip install -e api_client/python
pip install -e grr/client_builder
pip install -e grr/server/[mysqldatastore]
pip install -e colab
pip install -e grr/test

# Step 7
pip install --no-cache-dir -f https://storage.googleapis.com/releases.grr-response.com/index.html grr-response-templates

# Step 8
apt install -y mysql-server

# Step 9
grr_config_updater initialize