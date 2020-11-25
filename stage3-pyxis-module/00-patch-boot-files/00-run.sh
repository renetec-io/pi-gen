#!/bin/bash -e

patch -f -s ${ROOTFS_DIR}/boot/config.txt files/config.patch

if [ $? ]; then
  exit 1
if
