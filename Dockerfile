FROM ghcr.io/fragoi/debuild:20.8

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
