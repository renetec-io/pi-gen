#!/bin/bash -e

git clone --depth 1  https://github.com/aircrack-ng/rtl8812au.git -b v5.3.4
cd rtl8812au

sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM64_RPI = n/CONFIG_PLATFORM_ARM64_RPI = y/g' Makefile

#sed -i 's/^dkms build/ARCH=arm dkms build/' dkms-install.sh

#sed -i 's/^MAKE="/MAKE="ARCH=arm\ /' dkms.conf
sed -i 's/^MAKE="/MAKE="ARCH=arm\ KVER=\"5.4.72-v7+\"\ /' dkms.conf

DRV_NAME=rtl8812au
DRV_VERSION=5.3.4

install -d "${ROOTFS_DIR}/usr/src/${DRV_NAME}-${DRV_VERSION}"
find . -type f -exec install -Dm 644 "{}" "${ROOTFS_DIR}/usr/src/${DRV_NAME}-${DRV_VERSION}/{}" \;

on_chroot << EOF
dkms add -m ${DRV_NAME} -v ${DRV_VERSION}
ARCH=arm KVER="5.4.72-v7+" dkms build -m ${DRV_NAME} -v ${DRV_VERSION}
dkms install -m ${DRV_NAME} -v ${DRV_VERSION}
EOF
