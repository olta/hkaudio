FROM ubuntu:20.04

ENV LANG=C.UTF-8

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get install -y \
               bc bison build-essential chrpath cmake cpio curl dbus-x11 device-tree-compiler \
               diffstat dosfstools dropbear-bin flex gawk git gnupg g++ iptables iputils-ping libbz2-dev \
               libncurses5-dev libssl-dev libusb-1.0-0-dev libzip-dev libzstd-dev locales lz4 mtools \
               nano pigz pkg-config python-is-python3 \
               python3 python3-git python3-jinja2 pylint3 python3-pip python3-pexpect python3-subunit \
               rsync sudo texinfo tmux vim wget zstd

RUN echo "LC_CTYPE=\"en_US.UTF-8\"" >> /etc/default/locale
RUN locale-gen en_US.UTF-8

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo
RUN chmod a+x /bin/repo

