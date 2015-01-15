FROM phusion/baseimage:0.9.15
MAINTAINER Paul 'Limey' Cockrell <paul.cockrell@evogi.com>

ENV DEBIAN_FRONTEND noninteractive

################################################################################
# Enable insecure key permanently for ssh access
################################################################################

RUN /usr/sbin/enable_insecure_key

################################################################################
# Set correct environment variables
################################################################################

ENV HOME /root

################################################################################
# Use baseimage-docker's init process
################################################################################

CMD ["/sbin/my_init"]

################################################################################
# Install packages required to build rubies, java and other dependancies
################################################################################

RUN \
    apt-get update && \
    apt-get -y install build-essential xauth \
    libxext-dev libxrender-dev libxtst-dev \
    openjdk-6-jdk maven && \
    rm -rf /var/lib/apt/lists/*

################################################################################
# Set Java home env var
################################################################################

ENV JAVA_HOME /usr/lib/jvm/java-6-openjdk-amd64

################################################################################
# Install Apache Directory Services
################################################################################

WORKDIR /home/app/ads

RUN \
    curl http://mirror.catn.com/pub/apache//directory/studio/dist/2.0.0.v20130628/ApacheDirectoryStudio-linux-x86_64-2.0.0.v20130628.tar.gz | tar xvz

################################################################################
# Modify SSHD script to allow X11Forwarding
################################################################################

RUN echo X11Forwarding yes >> /etc/ssh/ssh_config

################################################################################
# Clean up APT when done
################################################################################

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
