FROM ghcr.io/fragoi/debuild:24.1

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
