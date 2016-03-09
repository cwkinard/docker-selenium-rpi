
#!/bin/bash
while ! nc -z selenium 4444; do sleep 3; done
/usr/bin/phantomjs --webdriver `hostname -I | awk '{print $1}'`:8080 --webdriver-selenium-grid-hub http://selenium:4444
