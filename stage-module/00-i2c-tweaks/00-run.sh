#!/bin/bash -e

CONFIG=${ROOTFS_DIR}/boot/config.txt

printf "\n# Enable I2C0 on pins 44, 45" | tee -a $CONFIG
echo "dtoverlay=i2c0,pins_44_45" | tee -a $CONFIG
echo "dtparam=i2c_vc=on" | tee -a $CONFIG