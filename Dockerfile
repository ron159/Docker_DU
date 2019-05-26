FROM ubuntu:18.04

LABEL AUTHOR=ron<zlronron159@gmail.com>

WORKDIR /root/dl
ADD conf /root/dl/conf


RUN buildDeps='curl wget vim aria2 unzip nginx openssh-server' \
    && apt-get update \
    && apt upgrade -y \
    && apt-get install -y $buildDeps \
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
    && chmod 777 aria2.session \
    && chmod +x run.sh
    #ssh
RUN mkdir /var/run/sshd \
    && echo "root:HYDron159+1s" | chpasswd \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


#VOLUME /root/downloader/Download

EXPOSE 80 6800 22
ENTRYPOINT ["/root/dl/conf/run.sh"]

