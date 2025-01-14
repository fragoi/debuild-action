FROM ghcr.io/fragoi/debuild:20.13

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
