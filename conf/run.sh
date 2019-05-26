#!/bin/bash

do
  /usr/bin/aria2c --conf-path="/root/dl/conf/aria2.conf" -D \
  && /usr/sbin/nginx -c /root/dl/conf/nginx.conf \
  && tail -f /var/log/nginx/error.log
done
