#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

set -e

trap 'on_exit $? $LINENO' EXIT

function on_exit()
{
  if [ "$1" != "0" ]; then
    echo "Error $1 occured on $2" >&2
  fi 

}

BAT_VER="0.18.3"
GIT_DELTA_VER="0.8.3"
wget "https://github.com/sharkdp/bat/releases/download/v${BAT_VER}/bat_${BAT_VER}_amd64.deb"

dpkg -i "bat_${BAT_VER}_amd64.deb"

rm "bat_${BAT_VER}_amd64.deb"

apt update 
apt install man 

# echo "export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"" >> ~/.profile
wget "https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VER}/git-delta-musl_${GIT_DELTA_VER}_amd64.deb"

dpkg -i "git-delta-musl_${GIT_DELTA_VER}_amd64.deb"

rm  "git-delta-musl_${GIT_DELTA_VER}_amd64.deb"

