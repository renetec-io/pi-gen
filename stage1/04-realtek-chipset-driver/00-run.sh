#!/bin/bash -e

# install -m 755 files/install_rtl8812au "${ROOTFS_DIR}/etc/init.d/"

git clone --depth 1  https://github.com/aircrack-ng/rtl8812au.git -b v5.3.4
cd rtl8812au

sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM64_RPI = n/CONFIG_PLATFORM_ARM64_RPI = y/g' Makefile

#sed -i 's/^dkms build/ARCH=arm dkms build/' dkms-install.sh

sed -i 's/^MAKE="/MAKE="ARCH=arm\ /' dkms.conf
#sed -i 's/^MAKE="/MAKE="ARCH=arm\ KVER=\"5.4.72-v7+\"\ /' dkms.conf

DRV_NAME=rtl8812au
DRV_VERSION=5.3.4

install -d "${ROOTFS_DIR}/usr/src/${DRV_NAME}-${DRV_VERSION}"
find . -type f -exec install -Dm 644 "{}" "${ROOTFS_DIR}/usr/src/${DRV_NAME}-${DRV_VERSION}/{}" \;

echo $( find ${ROOTFS_DIR}/usr/src -name "linux-headers*" )

on_chroot << EOF
echo $(find ${ROOTFS_DIR}/usr/src -name "linux-headers*")
echo 0
FILE1=$(find ${ROOTFS_DIR}/usr/src -name "linux-headers*")
dkms add -m ${DRV_NAME} -v ${DRV_VERSION}
echo 1
#for FILE1 in $( find ${ROOTFS_DIR}/usr/src -name "linux-headers*" )
#do
echo 2
KERNAL_VERSION=$( echo $( basename "$FILE1" ) | cut -d- -f3- )
dkms build -m ${DRV_NAME} -v ${DRV_VERSION} -k ${KERNAL_VERSION}
dkms install -m ${DRV_NAME} -v ${DRV_VERSION} -k ${KERNAL_VERSION}
#done
EOF

#on_chroot << EOF
#systemctl enable install_rtl8812au
#EOF
