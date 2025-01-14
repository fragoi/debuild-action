FROM ghcr.io/fragoi/debuild:20.14

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
