FROM dockerfile/java:oracle-java8
MAINTAINER Lee Chang <leetchang@gmail.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y supervisor

RUN \
    wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.0.deb && \
    dpkg -i elasticsearch-1.5.0.deb 

ADD etc/supervisor/conf.d/elasticsearch.conf /etc/supervisor/conf.d/elasticsearch.conf

EXPOSE 9200 

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]