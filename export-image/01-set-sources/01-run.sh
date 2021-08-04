#!/bin/bash -e

# Done with build-time package installations, remove staging repository
sed -i '/staging/d' "${ROOTFS_DIR}/etc/apt/sources.list.d/pyxian.list"

rm -f "${ROOTFS_DIR}/etc/apt/apt.conf.d/51cache"
find "${ROOTFS_DIR}/var/lib/apt/lists/" -type f -delete
on_chroot << EOF
apt-get update
apt-get -y dist-upgrade
apt-get clean
EOF
