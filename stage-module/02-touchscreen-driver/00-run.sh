#!/bin/bash -e


CONFIG=${ROOTFS_DIR}/boot/config.txt

# Compile device tree overlay blob
dtc -I dts -O dtb -o goodix_i2c0.dtbo files/goodix_gt911_i2c0.dts

install -v -m 644 goodix_i2c0.dtbo ${ROOTFS_DIR}/boot/overlays

echo -e "
# Enable touch input
gpio=40=op,dl
dtoverlay=goodix_i2c0" | tee -a $CONFIG > /dev/null
