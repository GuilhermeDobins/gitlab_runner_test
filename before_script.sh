#!/usr/bin/env bash

apt-get update
apt-get install -y rpm
apt-get install -y build-essential python3 python3-pip tar wget lftp git
python3 -m pip install requests
printf "set ssl:verify-certificate false" > ~/.lftprc
git clone https://github.com/GuilhermeDobins/gitlab_runner_test
git clone https://github.com/rpsene/goconfig
cd goconfig
source ./go.sh install
cp -p /usr/local/go/bin/go /usr/local/bin
