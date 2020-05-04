#!/bin/bash -e

sudo sed -i '/\[Install\]/i TimeoutStopSec=1' "${ROOTFS_DIR}/lib/systemd/system/pigpiod.service"
