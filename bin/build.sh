#!/bin/bash -e

SUFFIX="tar.gz"

warn() {
  echo 1>&2 "$@"
}

findOne() {
  local -n var=$1
  local suffix=$2
  local file=($(ls -d *${suffix}))
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
  if [[ "$archive" =~ .*".orig.${SUFFIX}" ]]; then
    var="$archive"
    return 0
  fi

  if ! [[ "$archive" =~ (.*)-(.*)".${SUFFIX}" ]]; then
    warn "${archive} does not match pattern"
    return 1
  fi

  local name=${BASH_REMATCH[1]}
  local version=${BASH_REMATCH[2]}

  echo "Name: ${name}"
  echo "Version: ${version}"

  var="${name}_${version}.orig.${SUFFIX}"
}

dirName() {
  local -n var=$1
  local archive=$2

  if ! [[ "$archive" =~ (.*)_(.*)".orig.${SUFFIX}" ]]; then
    warn "${archive} does not match pattern"
    return 1
  fi

  local name=${BASH_REMATCH[1]}
  local version=${BASH_REMATCH[2]}

  echo "Name: ${name}"
  echo "Version: ${version}"

  var="${name}-${version}"
}

echo "Looking for orig archive"

if ! findOne orig ".orig.${SUFFIX}"; then

  echo "Orig archive not found, looking for upstream archive"

  if ! findOne archive ".${SUFFIX}"; then
    echo "Upstream archive not found, abort."
    exit 1
  fi

  echo "Found upstream archive ${archive}"

  origName orig "$archive"

  echo "Rename archive as ${orig}"

  mv "$archive" "$orig"

else

  echo "Found orig archive ${orig}"

fi

dirName dir "$orig"

if ! [ -d "$dir" ]; then
  echo "Extracting orig archive"
  tar -xf "$orig"
else
  echo "Directory already exists"
fi

echo "Changing directory ${dir}"

cd "$dir"

echo "Installing dependencies"

install-deps.sh "debian/control"

echo "Run debuild"

debuild -S --no-sign
