#!/bin/bash

sudo cp -f /boot/config.txt /boot/configORG.txt
sudo cp -f /boot/config.txt /opt/

config_file="/opt/config.txt"


# Cấu hình cho Màn hình 1
config_1="hdmi_drive=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt 800 480 60 6 0 0 0"

# Cấu hình cho Màn hình 2
config_2="hdmi_ignore_hotplug=0
hdmi_group=2
hdmi_mode=82
hdmi_cvt 1920 1080 60 3 0 0 0
dtoverlay=vc4-fkms-v3d
max_framebuffers=2
hdmi_ignore_hotplug=1
hdmi_force_hotplug=0
hdmi_group=1
hdmi_mode=1"

# Kiểm tra và thay đổi cấu hình
if grep -q "hdmi_mode=87" "$config_file"; then
    echo "Switching to Configuration 2"
    sudo sed -i '/hdmi_/d' "$config_file"
    echo "$config_2" >> "$config_file"

else 
    echo "Switching to Configuration 1"
    sudo sed -i '/hdmi_/d' "$config_file"
    echo "$config_1" >> "$config_file"
	
    if grep -q "dtoverlay=vc4-fkms-v3d" "$config_file"; then
        sudo sed -i '/dtoverlay=vc4-fkms-v3d/d' "$config_file"
    fi
    
    if grep -q "max_framebuffers=2" "$config_file"; then
        sudo sed -i '/max_framebuffers=2/d' "$config_file"
    fi
	

fi
sleep 1
sudo cp -f /opt/config.txt /boot/
sleep 1


sudo reboot

