FROM ubuntu:trusty
MAINTAINER Fernando Mayo <fernando@tutum.co>

# To fix WARNING: overcommit_memory is set to 0!
#RUN echo "vm.overcommit_memory = 1'" |tee -a /etc/sysctl.conf
#RUN sysctl vm.overcommit_memory=1

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv C7917B12 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y redis-server pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add scripts
ADD run.sh /run.sh

ENV REDIS_PASS **Random**
ENV REDIS_DIR /data
VOLUME ["/data"]

EXPOSE 6379
CMD ["/run.sh"]
