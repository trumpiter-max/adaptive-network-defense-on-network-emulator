FROM docker.elastic.co/logstash/logstash:8.15.3

USER root

RUN apt-get -y install net-tools \
    iproute2 \
    tcpdump \
    net-tools

COPY pipeline/logstash.conf /usr/share/logstash/pipeline/logstash.conf

# Fixing user variable at the end so GNS3 can catch proper user
USER logstash
