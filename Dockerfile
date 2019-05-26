FROM ubuntu:18.04

LABEL AUTHOR=ron<zlronron159@gmail.com>

WORKDIR /root/dl
ADD conf /root/dl/conf


RUN buildDeps='curl wget vim aria2 unzip nginx' \
    && apt-get update \
    && apt upgrade -y \
    && apt-get install -y $buildDeps \
    #&& apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /Download \
    && mv /root/dl/conf/nginx.conf /etc/nginx/nginx.conf
    #AriaNg
RUN mkdir /root/dl/ariang \
    && cd /root/dl/ariang \
    && wget https://github.com/mayswind/AriaNg/releases/download/1.1.0/AriaNg-1.1.0.zip \
    && unzip AriaNg-1.1.0.zip \
    && rm -rf AriaNg-1.1.0.zip \
    && chmod 777 index.html 
    #rclone
RUN cd /root/dl \
    && curl https://rclone.org/install.sh | bash \ 
    && cd /root/dl/conf \
    && chmod 777 autoupload.sh \
    && touch aria2.session\
    && chmod 777 aria2.session


#VOLUME /root/downloader/Download

EXPOSE 80
CMD ["/bin/sh", "/root/dl/conf/run.sh" ]

