#!/bin/bash

git clone https://github.com/Otus-DevOps-2017-11/reddit.git
cd reddit && bundle install

sudo mv /tmp/puma-server.service /etc/systemd/system/
sudo systemctl enable puma-server.service
