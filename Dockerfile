FROM jayjohnson/owasp-jenkins:latest

#Install filebeat
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.2.4-amd64.deb
RUN dpkg -i filebeat-6.2.4-amd64.deb

#copy filebeat config file
COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod go-w /etc/filebeat/filebeat.yml

#CMD service filebeat start

#ENTRYPOINT /opt/owasp/owasp_jenkins/scripts/start-container.sh
COPY entrypoint.sh /configdir/

ENV PATH $PATH:/configdir/
RUN chmod 777 /configdir/entrypoint.sh

ENTRYPOINT ["entrypoint.sh", "run"]
