FROM ghcr.io/fragoi/debuild:20.15

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
