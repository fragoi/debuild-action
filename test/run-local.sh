#!/bin/bash -e

workspace=$1

warn() {
  echo 1>&2 "$@"
}

error() {
  warn "$@"
  exit 1
}

[ "$workspace" ] || error "Usage: $0 <workspace>"

[ "$INPUT_PPA" ] || warn "Missing environment property: INPUT_PPA"

image='debuild-action:latest'
dir="$(dirname $0)/.."

docker build -t "$image" "$dir"

docker run --rm --workdir "/workspace" \
  -v "$workspace":"/workspace" \
  -e "INPUT_PPA" \
  "$image"
