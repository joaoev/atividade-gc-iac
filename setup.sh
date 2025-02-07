#!/bin/bash
apt update -y && apt upgrade -y
apt install -y python3 python3-pip

mkdir -p /opt/flask_app
cd /opt/flask_app

cp /tmp/app.py /opt/flask_app/app.py
chmod +x app.py

pip3 install flask

setcap 'cap_net_bind_service=+ep' /usr/bin/python3

nohup python3 app.py > output.log 2>&1 &
