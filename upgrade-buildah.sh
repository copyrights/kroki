#!/bin/bash
set -euxo pipefail
sudo apt-get -y -qq update
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:alexlarsson/flatpak
sudo add-apt-repository -y ppa:gophers/archive
sudo apt-add-repository -y ppa:projectatomic/ppa
sudo apt-get -y -qq update
sudo apt-get -y install bats btrfs-tools git libapparmor-dev libdevmapper-dev libglib2.0-dev libgpgme11-dev libseccomp-dev libselinux1-dev skopeo-containers go-md2man
sudo apt-get -y install golang-1.13

mkdir ~/buildah
cd ~/buildah
export GOPATH=`pwd`
git clone https://github.com/containers/buildah ./src/github.com/containers/buildah
cd ./src/github.com/containers/buildah
PATH=/usr/lib/go-1.13/bin:$PATH make runc all SECURITYTAGS="apparmor seccomp"
sudo make install install.runc
buildah --help
