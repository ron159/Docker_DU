#!/bin/bash

while true; do
  /usr/bin/aria2c --conf-path="/root/conf/aria2.conf" -D
  service nginx start
done
