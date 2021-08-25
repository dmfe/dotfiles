#!/bin/sh

ext_so=webm
ext_de=mp3

IFS=$'\n'      # Change IFS to new line
files=($(ls -1 *.${ext_so}))

for file in "${files[@]}"; do
    name=$(echo "${file}" | sed "s/.${ext_so}//g")
    dest_file="${name}.${ext_de}"
    echo "Source File: ${file}"
    echo "Destination File: ${dest_file}"

    ffmpeg -i "${file}" -vn "${dest_file}"
    rm -f "${file}"
done
