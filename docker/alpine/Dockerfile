FROM alpine:latest

RUN apk add --no-cache libc6-compat curl jq wget tini && \
    cd /tmp && \
    wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.15.3-linux-x86_64.tar.gz && \
    tar xzvf filebeat-8.15.3-linux-x86_64.tar.gz && \
    mv filebeat-8.15.3-linux-x86_64/filebeat /usr/local/bin && \
    mkdir -p /etc/filebeat/conf.d /etc/filebeat/modules.d /etc/filebeat/log && \
    rm -rf /filebeat* && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=$PATH:/usr/local/bin/filebeat

COPY filebeat.yml /etc/filebeat/filebeat.yml

RUN chmod +x /usr/local/bin/filebeat && \
    chmod go-w /etc/filebeat/filebeat.yml

WORKDIR /usr/local/bin

CMD ["/usr/local/bin/filebeat", "-e", "-c", "/etc/filebeat/filebeat.yml", "&&", "tini", "--"]
