#!/bin/bash

while true; do
  /usr/bin/aria2c --conf-path="/root/dl/conf/aria2.conf" -D \
  && /usr/sbin/nginx -c /etc/nginx/nginx.conf
done
