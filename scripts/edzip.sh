#!/bin/sh

if [[ -n "$1" && -n "$2" ]]; then
  unzip "$1" "$2" -d "/tmp"
  cur_dir=$(pwd)
  pushd /tmp
  ${EDITOR:-vim} "$2" && zip --update "$cur_dir/$1" "$2"
  popd
else
  echo "Usage: edzip archive.zip file.txt"
fi

