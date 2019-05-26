#!/bin/bash

/usr/bin/aria2c --conf-path="/root/dl/conf/aria2.conf" -D \
&& service ssh start \
&& nginx -g "daemon off;"

