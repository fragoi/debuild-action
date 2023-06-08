#!/bin/bash -e

control=$1
## Empty (source), -Arch, -Indep
type=$2

depends=$(cat "$control" | deb-control-field.sh "Build-Depends${type}")
conflicts=$(cat "$control" | deb-control-field.sh "Build-Conflicts${type}")

echo "Depends: ${depends}"
echo "Conflicts: ${conflicts}"

if [ -z "$depends" ] && [ -z "$conflicts" ]; then
  exit
fi

apt-get update
apt-get satisfy -y "$depends" \
  ${conflicts:+"Conflicts: ${conflicts}"}
