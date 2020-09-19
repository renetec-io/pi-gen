#!/bin/bash
CONFIG=${ROOTFS_DIR}/boot/config.txt

sed -i "1i dtoverlay=i2c0-bcm2708,pins_44_45" $CONFIG;
echo "gpio=40=op,dh" | tee -a $CONFIG

# Compile device tree overlay blob
dtc -I dts -O dtb -o goodix_i2c0.dtbo files/goodix_gt911_i2c0.dts

install -v -m 644 goodix_i2c0.dtbo ${ROOTFS_DIR}/boot/overlays
