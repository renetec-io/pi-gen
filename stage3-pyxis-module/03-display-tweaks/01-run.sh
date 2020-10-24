#!/bin/bash -e

CONFIG=${ROOTFS_DIR}/boot/config.txt

echo -e "
# Set Pyxis HDMI parameters
hdmi_force_hotplug=1
hdmi_group=2
hdmi_mode=87
hdmi_timings=1200 1 60 10 35 1920 1 5 2 6 0 0 0 50 0 126128250 5
max_framebuffer_width=1920
max_framebuffer_height=1920
display_rotate=0" | tee -a $CONFIG > /dev/null
