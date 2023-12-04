#!/bin/bash
# wget -O - https://raw.githubusercontent.com/quatmo/runesq/main/mod | sh
# nen sudo tar -czvf xx.tar.gz
# gnen sudo tar -xzvf --overwrite -C /
cd /tmp
wget https://raw.githubusercontent.com/quatmo/runesq/main/up/mpd_index.js
sleep 0.3
rm /volumio/app/plugins/music_service/mpd/index.js
cp -f /tmp/mpd_index.js /volumio/app/plugins/music_service/mpd/index.js
sleep 0.3
/usr/bin/sudo chown volumio:volumio /volumio/app/plugins/music_service/mpd/index.js
sleep 0.3

/usr/bin/sudo /bin/systemctl restart volumio.service


