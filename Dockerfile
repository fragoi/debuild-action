FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y devscripts \
    && rm -rf /var/lib/apt

COPY ./entrypoint.sh /entrypoint.sh
COPY ./cleanup.sh /cleanup.sh

ENTRYPOINT [ "/entrypoint.sh" ]
