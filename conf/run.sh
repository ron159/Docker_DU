#!/bin/bash

do
  /usr/bin/aria2c --conf-path="/root/dl/conf/aria2.conf" -D \
  && service nginx start
done
