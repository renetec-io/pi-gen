#!/bin/bash -e
install -v -m 644 files/asound.conf "${ROOTFS_DIR}/etc/asound.conf"

CONFIG=${ROOTFS_DIR}/boot/config.txt

echo "Adding Device Tree Entry to $CONFIG"
echo "dtoverlay=hifiberry-dac" | tee -a $CONFIG
echo "dtoverlay=i2s-mmap" | tee -a $CONFIG
echo "dtoverlay=i2s-gpio28-31" | tee -a $CONFIG