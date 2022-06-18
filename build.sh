#!/usr/bin/env bash
LOCALPATH=$CI_PROJECT_DIR
github_version=$(cat github_version.txt)
ftp_version=$(cat ftp_version.txt)

if [ $github_version != '0' ]
then
  wget https://github.com/restic/restic/releases/download/v$github_version/restic-$github_version.tar.gz
  tar -xzf restic-$github_version.tar.gz
  mv restic-$github_version restic
  cd restic
  make all
  mkdir output
  mv restic output/restic-$github_version
  ls -la output
fi
