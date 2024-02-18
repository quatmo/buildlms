#!/bin/bash
# wget -O - https://raw.githubusercontent.com/quatmo/runesq/main/mod | sh
# sudo tar -czvf xx.tar.gz
# sudo tar -xzvf --overwrite -C /
cd /tmp

/usr/bin/sudo /bin/systemctl disable ssh.service

/usr/bin/sudo /bin/systemctl restart volumio.service

# sudo touch /boot/user_data

