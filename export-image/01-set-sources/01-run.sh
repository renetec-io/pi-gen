#!/bin/bash -e

# Done with build-time package installations, remove staging repository
sed -i '/pyxian-staging/d' "${ROOTFS_DIR}/etc/apt/sources.list.d/pyxian.list"

on_chroot << EOF
apt-get update
apt-get -y dist-upgrade
apt-get clean
EOF
