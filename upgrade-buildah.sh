#!/bin/bash
set -euxo pipefail
sudo apt-get -y -qq update
sudo apt-get -y install bats btrfs-progs git libapparmor-dev libdevmapper-dev libglib2.0-dev libgpgme11-dev libseccomp-dev libselinux1-dev skopeo go-md2man make
sudo apt-get -y install golang-1.18

mkdir ~/buildah
cd ~/buildah
export GOPATH=`pwd`
git clone https://github.com/containers/buildah ./src/github.com/containers/buildah
cd ./src/github.com/containers/buildah
PATH=/usr/lib/go-1.18/bin:$PATH make runc all SECURITYTAGS="apparmor seccomp"
sudo make install install.runc
buildah version
