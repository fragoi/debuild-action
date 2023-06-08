#!/bin/bash -e

eval $(ssh-agent -s)

exec "$@"
