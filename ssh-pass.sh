#!/bin/bash -e

if read pass; then
  echo "$pass"
  exit 0
else
  echo 1>&2 "$1"
  exit 1
fi
