#!/bin/bash -e

CONFIG=${ROOTFS_DIR}/boot/config.txt

# Compile and install device tree overlay blob
dtc -I dts -O dtb -o i2c0_44_45.dtbo files/i2c0_44_45.dts
install -v -m 644 i2c0_44_45.dtbo ${ROOTFS_DIR}/boot/overlays

echo -e "
# Enable I2C0 on pins 44, 45
dtoverlay=i2c0_44_45
dtparam=i2c_vc=on" | tee -a $CONFIG > /dev/null
