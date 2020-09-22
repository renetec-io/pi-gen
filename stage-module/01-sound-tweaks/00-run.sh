#!/bin/bash -e


CONFIG=${ROOTFS_DIR}/boot/config.txt

install -v -m 644 files/asound.conf "${ROOTFS_DIR}/etc/asound.conf"

# Remove default sound config
sed -i 's|^dtparam=audio=on$|#dtparam=audio=on|'  $CONFIG &> /dev/null

echo -e "
# Enable sound
dtoverlay=hifiberry-dac
dtoverlay=i2s-mmap
dtoverlay=i2s-gpio28-31" | tee -a $CONFIG > /dev/null
