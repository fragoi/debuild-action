FROM ghcr.io/fragoi/debuild:20.7

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
