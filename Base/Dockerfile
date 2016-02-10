############################################################
# Dockerfile - Selenium Hub/Server @ Raspberry Pi 2
# Based on raspbian
############################################################

FROM resin/rpi-raspbian:jessie

MAINTAINER Will Kinard "wilsonkinard@gmail.com"

# Install dependencies
RUN apt-get update && apt-get install -y \
	wget \
	unzip \
	oracle-java8-jdk \
	ca-certificates

# Selenium
RUN mkdir -p /opt/selenium && \
  && wget --no-verbose http://selenium-release.storage.googleapis.com/2.50/selenium-server-standalone-2.50.0.jar -O /opt/selenium/selenium-server-standalone.jar

# Add normal user with passwordless sudo
RUN sudo useradd seluser --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo seluser \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seluser:secret' | chpasswd \
  && chown -R seluser /opt/selenium
