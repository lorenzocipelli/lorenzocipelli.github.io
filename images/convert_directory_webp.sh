#!/bin/bash

PARAMS=('-m 6 -q 70 -mt -af -progress')
DIR="/photos"

if [ $# -ne 0 ]; then
	PARAMS=$@;
fi

cd "$(pwd)$DIR"
echo "$(pwd)$DIR"

shopt -s nullglob nocaseglob extglob

for FILE in *.@(jpg|jpeg|tif|tiff|png); do 
    cwebp $PARAMS "$FILE" -o "${FILE%.*}"_c.webp;
done