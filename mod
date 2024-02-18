#!/bin/bash
# wget -O - https://raw.githubusercontent.com/quatmo/runesq/main/mod | sh
# sudo tar -czvf xx.tar.gz
# sudo tar -xzvf --overwrite -C /
cd /tmp

cp -f /volumio/http/index.js /volumio/http/index_O.js
sed -i "s/dev.set('views', path.join(__dirname, 'dev\/views'));/dev.set('views', path.join(__dirname, 'devo\/views'));/g" /volumio/http/index.js
sed -i "s/dev.use(express.static(path.join(__dirname, 'dev')));/dev.use(express.static(path.join(__dirname, 'devo')));/g" /volumio/http/index.js
sed -i "s/app.use('\/dev', dev);/app.use('\/devo', dev);/g" /volumio/http/index.js
cp -rf /volumio/http/dev /volumio/http/devo
echo -e "if [ -e /boot/ssh ]; then\n    sudo rm /boot/ssh\nfi\n\nif [ ! -e /boot/volumio ]; then\n    /usr/bin/sudo /bin/systemctl stop ssh.service\n    sudo systemctl stop ssh.service\nfi" | /usr/bin/sudo tee -a /etc/network/if-pre-up.d/ethtool
/usr/bin/sudo /bin/systemctl disable ssh.service

/usr/bin/sudo /bin/systemctl restart volumio.service

# sudo touch /boot/user_data

