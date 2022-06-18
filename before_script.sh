#!/usr/bin/env bash

sudo apt update
sudo apt install -y rpm
sudo apt install -y build-essential python3 python3-pip tar wget lftp
printf "set ssl:verify-certificate false" > ~/.lftprc
git clone https://$USERNAME:$TOKEN@github.com/GuilhermeDobins/gitlab_ci
