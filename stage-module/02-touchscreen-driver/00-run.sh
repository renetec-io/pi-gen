#!/bin/bash -e


CONFIG=${ROOTFS_DIR}/boot/config.txt

# Compile device tree overlay blob
dtc -I dts -O dtb -o goodix_i2c0.dtbo files/goodix_gt911_i2c0.dts

install -v -m 644 goodix_i2c0.dtbo ${ROOTFS_DIR}/boot/overlays

printf "\n# Enable touch input" | tee -a $CONFIG
echo "gpio=40=op,dl" | tee -a $CONFIG
echo "dtoverlay=goodix_i2c0" | tee -a $CONFIG