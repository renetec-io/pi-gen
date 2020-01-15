#!/bin/bash -e

install -v -m 755 files/pngview                  "${ROOTFS_DIR}/usr/bin/"
install -v -m 777 files/libraspidmx.so.1         "${ROOTFS_DIR}/usr/lib/"
install -v -m 777 files/splashscreen.service     "${ROOTFS_DIR}/etc/systemd/system/"
install -v -m 644 files/splash.png               "${ROOTFS_DIR}/opt/"

on_chroot << EOF
systemctl enable splashscreen.service
EOF
