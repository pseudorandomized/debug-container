ARG ALPINE_TAG=latest

FROM alpine:${ALPINE_TAG}

LABEL maintainer="Antonis Antonopoulos"
LABEL description="Docker container with net tools and aws cli for docker/kubernetes troubleshooting and testing."

RUN apk upgrade \
    && apk add --no-cache \
    bash \
    busybox-extras \
    apache2-utils \
    git \
    net-tools \
    bind-tools \
    ca-certificates \
    tcpdump \
    tcptraceroute \
    tshark \
    wget \
    aws-cli \
    envsubst \
    coreutils \
    nfs-common \
    curl \
    iperf \
    iproute2 \
    iputils \
    jq \
    netcat-openbsd \
    nmap \
    nmap-nping \
    nmap-scripts \
    oath-toolkit-oathtool \
    openssh-client \
    openssl \
    nginx \
    socat \
    speedtest-cli \
    && rm -rf /var/cache/apk/*

EXPOSE 80 443

RUN echo 'echo "welcome to the container"' > /etc/profile.d/welcome.sh


CMD ["/usr/sbin/nginx", "-g", "daemon off;"]