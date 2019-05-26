FROM ubuntu:18.04

LABEL AUTHOR=ron<zlronron159@gmail.com>

WORKDIR /root/downloader
ADD conf /root/downloader/conf
#COPY run.sh /root

RUN buildDeps='curl wget vim aria2 unzip nginx' \
    && apt update \
    #&& apt upgrade -y \
    && apt install -y $buildDeps \
    && apt purge -y --auto-remove $buildDeps \
    && mkdir /root/downloader/Dwonlad
    #AriaNg
RUN mkdir /root/downloader/ariang \
    && cd /root/downloader/ariang \
    && wget -N --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.0/AriaNg-1.1.0.zip \
    && unzip AriaNg-1.1.0.zip \
    && rm -rf AriaNg-1.1.0.zip \
    && chmod 777 index.html 
    #rclone
RUN cd /root/downloader \
    && curl https://rclone.org/install.sh | sudo bash \
    && chmod 777 /root/conf/autouoload.sh


VOLUME /root/downloader/Dwonlad

EXPOSE 6800 8000 22

