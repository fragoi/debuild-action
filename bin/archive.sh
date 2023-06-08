#!/bin/bash

warn() {
  echo 1>&2 "$@"
}

findOne() {
  local -n var=$1
  local suffix=$2
  local file=($(ls -d *${suffix} 2> /dev/null || true))
  if (( ${#file[@]} != 1 )); then
    warn "Found ${#file[@]} files (${suffix})"
    return 1
  fi
  var=$file
}

origName() {
  local -n var=$1
  local archive=$2

  ## name looks good already
  if [[ "$archive" =~ .*".orig.".* ]]; then
    var="$archive"
    return 0
  fi

  if ! [[ "$archive" =~ (.*)-(.*)"."(.*) ]]; then
    warn "${archive} does not match pattern"
    return 1
  fi

  local name=${BASH_REMATCH[1]}
  local version=${BASH_REMATCH[2]}
  local extension=${BASH_REMATCH[3]}

  echo "Name: ${name}"
  echo "Version: ${version}"
  echo "Extension: ${extension}"

  var="${name}_${version}.orig.${extension}"
}

dirName() {
  local -n var=$1
  local archive=$2

  if ! [[ "$archive" =~ (.*)_(.*)".orig.".* ]]; then
    warn "${archive} does not match pattern"
    return 1
  fi

  local name=${BASH_REMATCH[1]}
  local version=${BASH_REMATCH[2]}

  var="${name}-${version}"
}
