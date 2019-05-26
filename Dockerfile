FROM ubuntu:18.04

LABEL AUTHOR=ron<zlronron159@gmail.com>

WORKDIR /root/dl
ADD conf /root/dl/conf


RUN buildDeps='curl wget vim aria2 unzip nginx' \
    && apt-get update \
    && apt upgrade -y \
    && apt-get install -y $buildDeps \
    #&& apt-get purge -y --auto-remove $buildDeps \
    && mkdir /root/dl/Download
    #AriaNg
RUN mkdir /root/dl/ariang \
    && cd /root/dl/ariang \
    && wget https://github.com/mayswind/AriaNg/releases/download/1.1.0/AriaNg-1.1.0.zip \
    && unzip AriaNg-1.1.0.zip \
    && rm -rf AriaNg-1.1.0.zip \
    && chmod 777 index.html 
    #rclone
RUN cd /root/dl \
    && curl https://rclone.org/install.sh | bash 
    #&& cd /root/downloader/conf \
    #&& chmod 777 autouoload.sh


#VOLUME /root/downloader/Dwonlad

EXPOSE 6800 8000 22

