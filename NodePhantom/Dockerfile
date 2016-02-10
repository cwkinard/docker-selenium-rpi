FROM cwkinard/selenium-node-base:2.50.0
MAINTAINER Will Kinard 'wilsonkinard@gmail.com'

USER root

#=========
# PhantomJS
#=========
RUN apt-get update -qqy \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/spfaffly/phantomjs-linux-armv6l/archive/master.zip && \
  unzip master.zip && \
  tar -zxvf phantomjs-linux-armv6l-master/*.tar.gz && \
  cp phantomjs-linux-armv6l-master/phantomjs-2.0.1-development-linux-armv6l/bin/ /bin/

#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json

USER seluser

