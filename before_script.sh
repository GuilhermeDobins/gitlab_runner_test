#!/usr/bin/env bash

apt-get update
apt-get install -y rpm
apt-get install -y build-essential python3 python3-pip tar wget lftp git
printf "set ssl:verify-certificate false" > ~/.lftprc
git clone https://$USERNAME:$TOKEN@github.com/GuilhermeDobins/gitlab_ci
