#!/bin/bash -e

CONFIG=${ROOTFS_DIR}/boot/config.txt

printf "\n# Set Pyxis HDMI parameters" | tee -a $CONFIG
echo "hdmi_force_hotplug=1" | tee -a $CONFIG
echo "hdmi_group=2" | tee -a $CONFIG
echo "hdmi_mode=87" | tee -a $CONFIG
echo "hdmi_timings=1200 1 60 10 35 1920 1 5 2 6 0 0 0 50 0 126128250 5" | tee -a $CONFIG
echo "max_framebuffer_width=1920" | tee -a $CONFIG
echo "max_framebuffer_height=1920" | tee -a $CONFIG
echo "display_rotate=0" | tee -a $CONFIG