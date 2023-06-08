#!/bin/bash -e

## import key
gpg --batch --pinentry-mode loopback \
    --passphrase-file <(cat <<< $INPUT_GPG_PASS) \
    --import <(cat <<< $INPUT_GPG_KEY)

## use key to cache passphrase
gpg --batch --pinentry-mode loopback \
    --passphrase-file <(cat <<< $INPUT_GPG_PASS) \
    --sign --dry-run <(echo)
