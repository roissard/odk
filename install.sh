#!/bin/bash

curl -sSL https://get.docker.com | sh

apt-get install -y python python-pip libffi-dev libssl-dev
pip install docker-compose

cp odk.service /etc/systemd/system/
systemctl enable odk
