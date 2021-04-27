#!/bin/fish
sudo apt update -y
# python3
sudo apt install python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools
python3 -m pip install tqdm
python3 -m pip install pycryptodome
python3 -m pip install numpy

# python2
sudo apt install python2 libpython2-dev -y
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py
rm get-pip.py
python2 -m pip install pycrypto
