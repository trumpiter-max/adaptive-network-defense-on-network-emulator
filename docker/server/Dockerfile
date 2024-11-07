FROM sagikazarmark/dvwa

# Install necessary packages
# RUN apt-get install -y wget

# Download and setup Filebeat
RUN cd /tmp && \
    wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.15.3-linux-x86_64.tar.gz && \
    tar xzvf filebeat-8.15.3-linux-x86_64.tar.gz && \
    mv filebeat-8.15.3-linux-x86_64/filebeat /usr/local/bin && \
    mkdir -p /etc/filebeat/conf.d && \
    mkdir -p /etc/filebeat/modules.d && \
    mkdir -p /etc/filebeat/log && \
    rm -rf /filebeat*

COPY filebeat.yml /etc/filebeat/filebeat.yml

ENV PATH=$PATH:/usr/local/bin/filebeat

COPY filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod +x /usr/local/bin/filebeat &&\
    chmod go-w /etc/filebeat/filebeat.yml
WORKDIR /usr/local/bin/

CMD ["/usr/local/bin/filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml"]
