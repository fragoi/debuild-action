FROM ghcr.io/fragoi/debuild:24.2

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
