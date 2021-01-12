#!/bin/bash -e

CONFIG=${ROOTFS_DIR}/boot/config.txt

# Compile and install device tree overlay blob
dtc -I dts -O dtb -o pyxis_sysman_i2c0.dtbo files/pyxis_sysman_i2c0.dts
install -v -m 644 pyxis_sysman_i2c0.dtbo ${ROOTFS_DIR}/boot/overlays

echo -e "
dtoverlay=pyxis_sysman_i2c0" | tee -a $CONFIG > /dev/null
