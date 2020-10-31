# https://developers.redhat.com/blog/2019/04/24/how-to-run-systemd-in-a-container
# https://github.com/defn/docker-systemd
# https://stackoverflow.com/questions/8671308/non-interactive-method-for-dpkg-reconfigure-tzdata

FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

ENV container docker

COPY detect-apt-proxy.sh /usr/bin

RUN chmod +x /usr/bin/detect-apt-proxy.sh \
    && echo 'Acquire::http::ProxyAutoDetect "/usr/bin/detect-apt-proxy.sh";' \
       | tee /etc/apt/apt.conf.d/00aptproxy

RUN apt-get update \  
    && yes | unminimize \
	&& apt-get install -y \
        avahi-daemon \
        cron \
        dbus \
        htop \
        iputils-ping \
        iproute2 \
        less \
        man-db \
        nano \
        openssh-server \
        screen \
        sudo \
        systemd \
        unzip \
        tzdata \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
	
RUN echo exit 0 > /usr/sbin/policy-rc.d

RUN adduser --disabled-password --gecos ' ' user \
	&& echo "user:user" | chpasswd \
	&& adduser user sudo

RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata

STOPSIGNAL SIGRTMIN+3

EXPOSE 22

ENTRYPOINT ["/sbin/init"]

CMD []

