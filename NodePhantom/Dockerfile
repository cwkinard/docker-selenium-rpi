FROM cwkinard/phantomjs-pi 
MAINTAINER Will Kinard "wilsonkinard@gmail.com"

RUN apt-get install -y netcat 

COPY join-hub.sh /usr/local/phantomjs/

RUN chmod 744 /usr/local/phantomjs/join-hub.sh


ENTRYPOINT [ "sh", "-c", "/usr/local/phantomjs/join-hub.sh" ]
