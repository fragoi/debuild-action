FROM ghcr.io/fragoi/debuild:20.12

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
