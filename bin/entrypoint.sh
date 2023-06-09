#!/bin/bash -e

if [ -n "$INPUT_PPA" ]; then
  add-apt-repository -y "$INPUT_PPA"
fi

build.sh -S --no-sign
