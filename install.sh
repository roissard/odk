#!/bin/bash

curl -sSL https://get.docker.com | sh

apt-get install -y python python-pip libffi-dev
pip install docker-compose

