FROM ubuntu:18.04

LABEL AUTHOR=ron<zlronron159@gmail.com>

WORKDIR /root
ADD conf /root/conf
#COPY run.sh /root

RUN buildDeps='curl wget vim aria2 unzip nginx' \
    && apt update \
    && apt upgrade \
    && apt install -y $buildDeps \
    && apt purge -y --auto-remove $buildDeps \
    && mkdir /Dwonlad \
    #AriaNg
    &&mkdir /root/ariang \
    && cd /root/ariang \
    && wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.0/AriaNg-1.1.0.zip \
    && unzip AriaNg-1.1.0.zip \
    && rm -rf AriaNg-1.1.0.zip \
    && chmod 777 index.html \
    #rclone
    && cd /root \
    && wget -N --no-check-certificate https://downloads.rclone.org/v1.47.0/rclone-v1.47.0-linux-amd64.deb \
    && dpkg -i rclone-v1.47.0-linux-amd64.deb \
    && rm -rf rclone-v1.47.0-linux-amd64.deb \
    && chmod 777 /root/conf/autouoload.sh


VOLUME /Download

EXPOSE 6800 8000 22

