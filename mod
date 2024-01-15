#!/bin/bash
# wget -O - https://raw.githubusercontent.com/quatmo/runesq/main/mod | sh
# nen sudo tar -czvf xx.tar.gz
# gnen sudo tar -xzvf --overwrite -C /
cd /tmp
tar -czvf /home/volumio/mpd_index.tar.gz /volumio/app/plugins/music_service/mpd/index.js

wget https://raw.githubusercontent.com/quatmo/runesq/main/up/mpd_index.js
sleep 0.3
rm /volumio/app/plugins/music_service/mpd/index.js
cp -f /tmp/mpd_index.js /volumio/app/plugins/music_service/mpd/index.js
sleep 0.3
/usr/bin/sudo chown volumio:volumio /volumio/app/plugins/music_service/mpd/index.js
sleep 0.3

wget https://raw.githubusercontent.com/quatmo/runesq/main/up/networkfs_index.js
sleep 0.3
rm /volumio/app/plugins/system_controller/networkfs/index.js
cp -f /tmp/networkfs_index.js /volumio/app/plugins/system_controller/networkfs/index.js
sleep 0.3
/usr/bin/sudo chown volumio:volumio /volumio/app/plugins/system_controller/networkfs/index.js
sleep 0.3

/usr/bin/sudo /bin/systemctl restart volumio.service


