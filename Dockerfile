############################################################
# Dockerfile - Selenium Hub/Server @ Raspberry Pi 2
# Based on raspbian
############################################################

FROM resin/rpi-raspbian:jessie

MAINTAINER Will Kinard "wilsonkinard@gmail.com"

EXPOSE 4444

ENV GRID_NEW_SESSION_WAIT_TIMEOUT -1
ENV GRID_JETTY_MAX_THREADS -1
ENV GRID_NODE_POLLING  5000
ENV GRID_CLEAN_UP_CYCLE 5000
ENV GRID_TIMEOUT 30000
ENV GRID_BROWSER_TIMEOUT 0
ENV GRID_MAX_SESSION 5
ENV GRID_UNREGISTER_IF_STILL_DOWN_AFTER 30000

# Install dependencies
RUN apt-get update && apt-get install -y \
	wget \
	unzip \
	oracle-java8-jdk \
	ca-certificates

# Download phantomjs
RUN wget https://github.com/spfaffly/phantomjs-linux-armv6l/archive/master.zip && \
  unzip master.zip && \
  tar -zxvf phantomjs-linux-armv6l-master/*.tar.gz && \
  cp phantomjs-linux-armv6l-master/phantomjs-2.0.1-development-linux-armv6l/bin/ /bin/

# Selenium
RUN mkdir -p /opt/selenium && \
  && wget --no-verbose http://selenium-release.storage.googleapis.com/2.50/selenium-server-standalone-2.50.0.jar -O /opt/selenium/selenium-server-standalone.jar

# Add normal user with passwordless sudo
RUN sudo useradd seluser --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo seluser \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seluser:secret' | chpasswd \
  && chown -R seluser /opt/selenium

USER seluser

COPY generate_config /opt/selenium/generate_config
COPY entry_point.sh /opt/bin/entry_point.sh

CMD ["/opt/bin/entry_point.sh"]
