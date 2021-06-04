#!/bin/bash

# Get NAME=Fedora or whichever distro line
# then cut out everything before =
DISTRO=`cat /etc/os-release | grep -Eo -m 1 'NAME=([A-Za-z"]*)' | cut -d "=" -f2`
echo On $DISTRO
echo "Installing dependencies"
if [[ "$DISTRO" =~ .*Ubuntu.* ]]; then
  echo Installing ubuntu deps
  apt-get install -y neovim npm gcc g++ cmake python-dev golang
fi

if [[ "$DISTRO" == "Fedora" ]]; then
  dnf install -y neovim npm gcc g++ cmake python-devel golang
fi

echo "Ensuring Pip is installed"
rm get-pip.py
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python2 get-pip.py
python3 get-pip.py
$1/anaconda3/bin/python -m get-pip.py
rm get-pip.py

echo "Ensuring system python can import neovim"
python -m pip install neovim pynvim
python2 -m pip install neovim pynvim
python3 -m pip install neovim pynvim
