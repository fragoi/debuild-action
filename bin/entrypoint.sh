#!/bin/bash -e

if [ -n "$INPUT_PPA" ]; then
  add-apt-repository "$INPUT_PPA"
fi

build.sh
