FROM ubuntu:18.04

LABEL AUTHOR=angaziwa<Telegram@Angaziwa>

WORKDIR /root
ADD conf /root/dl/conf


RUN buildDeps='curl wget vim unzip nginx openssh-server' \
    && apt-get update \
    && apt upgrade -y \
    && apt-get install -y $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /Download \
    && mv /root/dl/conf/nginx.conf /etc/nginx/nginx.conf
    #AriaNg
RUN rm -rf /var/www/html/ \
    && mkdir /var/www/html \
    && cd /var/www/html/ \
    && wget https://github.com/mayswind/AriaNg/releases/download/1.1.1/AriaNg-1.1.1-AllInOne.zip \
    && unzip AriaNg-1.1.1-AllInOne.zip \
    && rm -rf AriaNg-1.1.1-AllInOne.zip \
    && chmod 777 index.html 
    #rclone
RUN cd /root/dl \
    && curl https://rclone.org/install.sh | bash \ 
    && cd /root/dl/conf \
    && chmod 777 autoupload.sh \
    && chmod +x run.sh \ 
    #aria2 
    && cd /root \
    && wget wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/aria2.sh && chmod +x aria2.sh
    #ssh
RUN mkdir /var/run/sshd \
    && echo "root:password" | chpasswd \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


#VOLUME /root/downloader/Download

EXPOSE 80 6800 22
ENTRYPOINT ["/root/dl/conf/run.sh"]

