# Bamboo Server

FROM phusion/baseimage:latest
MAINTAINER Mateusz Trojak "matisq@op.pl"
LABEL version="1.1"
LABEL description="Based on hwuethrich/bamboo-server with added java 1.8 and some refactoring"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Environment
ENV BAMBOO_VERSION 5.15.3
ENV BAMBOO_HOME /home/bamboo
ENV BAMBOO_SERVER_ID bamboo-server

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Add runit service
ADD bamboo-server.sh /etc/service/bamboo-server/run
RUN chmod +x /etc/service/bamboo-server/run

# Add locales after locale-gen as needed
# Upgrade packages on image
# Install JDK 8 (latest edition), SVN, git  and wget
RUN locale-gen en_US.UTF-8 &&\
    apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew" --no-install-recommends openjdk-8-jdk &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y subversion git wget --no-install-recommends &&\
    apt-get -q autoremove &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin && rm -f /var/tmp/*
