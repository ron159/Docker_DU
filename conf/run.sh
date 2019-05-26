#!/bin/bash

/usr/bin/aria2c --conf-path="/root/dl/conf/aria2.conf" -D \
&& nginx -g "daemon off;"

