#!/bin/sh

if [ $# -ne 2 ]
then
	echo "usage: $0 [input-jpg-file] [output-json-file]"
	exit 1
fi

steghide extract -p "nextcypher multipass" -sf $1 -xf $2

