#!/bin/bash -e

CONFIG=${ROOTFS_DIR}/boot/config.txt

echo -e "
# Enable I2C0 on pins 44, 45
dtoverlay=i2c0,pins_44_45
dtparam=i2c_vc=on" | tee -a $CONFIG > /dev/null
