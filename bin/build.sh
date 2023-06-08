#!/bin/bash -e

. archive.sh

echo "Looking for orig archive"

if ! findOne orig ".orig.tar.gz"; then

  echo "Orig archive not found, looking for upstream archive"

  if ! findOne archive ".tar.gz"; then
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
