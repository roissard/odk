#!/bin/bash

curl -sSL https://get.docker.com | sh

apt-get install -y python libffi-dev libssl-dev docker-compose

cp odk.service /etc/systemd/system/
systemctl enable odk
