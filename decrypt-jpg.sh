#!/bin/sh

if [ $# -ne 3 ]
then
	echo "usage: $0 [input-jpg-file] [output-json-file] [passphrase]"
	exit 1
fi

steghide extract -p "$3" -sf $1 -xf $2

