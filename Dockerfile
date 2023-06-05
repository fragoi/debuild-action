FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y devscripts \
    && rm -rf /var/lib/apt

COPY *.sh /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
