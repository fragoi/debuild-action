FROM ghcr.io/fragoi/debuild:24.0

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
