#!/bin/bash -e

git clone --depth 1  https://github.com/aircrack-ng/rtl8812au.git -b v5.3.4
cd rtl8812au

sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' Makefile
sed -i 's/CONFIG_PLATFORM_ARM64_RPI = n/CONFIG_PLATFORM_ARM64_RPI = y/g' Makefile

sed -i 's/^dkms build/ARCH=arm dkms build/' dkms-install.sh
sed -i 's/^MAKE="/MAKE="ARCH=arm\ /' dkms.conf

on_chroot << EOF
./dkms-install.sh
EOF
