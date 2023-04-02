#!/bin/sh

echo $1
file="file_$1M"
echo "File $file created"

dd if=/dev/random of=./Files/$file bs=$1M count=1
