FROM ghcr.io/fragoi/debuild:20.10

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
