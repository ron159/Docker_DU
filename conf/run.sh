#!/bin/bash

/usr/bin/aria2c --conf-path="/root/.aria2/aria2.conf" -D \
&& service ssh start \
&& nginx -g "daemon off;"

