#!/bin/bash -e

DISPLAY=:0 SSH_ASKPASS=ssh-pass.sh ssh-add \
  <(cat <<< $INPUT_SSH_KEY) \
  <<< $INPUT_SSH_PASS
