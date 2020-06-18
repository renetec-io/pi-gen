#!/bin/bash -e

install -v -m 755 files/pngview                  "${ROOTFS_DIR}/usr/bin/"
install -v -m 777 files/libraspidmx.so.1         "${ROOTFS_DIR}/usr/lib/"
install -v -m 644 files/splashscreen.service     "${ROOTFS_DIR}/etc/systemd/system/"
install -d                                       "${ROOTFS_DIR}/usr/share/splash_images/"
install -v -m 644 files/splash_images/*          "${ROOTFS_DIR}/usr/share/splash_images/"

on_chroot << EOF
systemctl enable splashscreen.service
ln -sfn /usr/share/splash_images/splash_normal_420.png /opt/splash.png
EOF
