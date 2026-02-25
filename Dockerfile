FROM ghcr.io/fragoi/debuild:u24.0

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
