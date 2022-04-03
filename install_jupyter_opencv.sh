#!/bin/bash

# System: Ubuntu-18.04 (amd64)

sudo apt install python2 python3 python3.8 python3-venv python3.8-venv
sudo apt update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 0
sudo apt update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
mkdir ~/JPT-OCV
cd ~/JPT-OCV
python3 -m venv .venv --prompt JPT-OCV
source .venv/bin/activate
pip3 install -U pip
pip3 install -U setuptools
pip install jupyterlab
pip install opencv-python==3.4.17.63 Pillow matplotlib

# source .venv/bin/activate
# jupyter-lab
