# Bamboo Server

FROM phusion/baseimage:latest
MAINTAINER Mateusz Trojak "matisq@op.pl"
LABEL version="1.1"
LABEL description="Bamboo Agent"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Environment
ENV HOME /root/

# Expose web and agent ports
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Add runit service
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Add locales after locale-gen as needed
# Upgrade packages on image
# Install JDK 8 (latest edition), SVN, git  and wget
RUN locale-gen en_US.UTF-8 &&\
    apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew" --no-install-recommends openjdk-8-jdk &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y subversion wget git --no-install-recommends &&\
    apt-get -q autoremove &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin && rm -f /var/tmp/*

CMD ["/run.sh"]
