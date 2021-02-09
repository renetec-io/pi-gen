#!/bin/bash -e

patch -f -s ${ROOTFS_DIR}/boot/config.txt files/config.patch

