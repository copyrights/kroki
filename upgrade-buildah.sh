#!/bin/bash
set -euxo pipefail
apt-get -y -qq update
apt-get -y install software-properties-common
add-apt-repository -y ppa:alexlarsson/flatpak
add-apt-repository -y ppa:gophers/archive
apt-add-repository -y ppa:projectatomic/ppa
apt-get -y -qq update
apt-get -y install bats btrfs-tools git libapparmor-dev libdevmapper-dev libglib2.0-dev libgpgme11-dev libseccomp-dev libselinux1-dev skopeo-containers go-md2man
apt-get -y install golang-1.13

mkdir ~/buildah
cd ~/buildah
export GOPATH=`pwd`
git clone https://github.com/containers/buildah ./src/github.com/containers/buildah
cd ./src/github.com/containers/buildah
PATH=/usr/lib/go-1.13/bin:$PATH make runc all SECURITYTAGS="apparmor seccomp"
make install install.runc
buildah --help
