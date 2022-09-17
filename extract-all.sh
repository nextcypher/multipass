#!/bin/bash

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

for (( n=1; n<=$N; n++ ))
do
	XF=`printf 'checkdata/%04u.json' $n`
	ENCF=`printf 'jpgdata/%04u.jpg' $n`
	#echo "$EF -> $ENCF"

	steghide extract -sf $ENCF -xf $XF -p "nextcypher multipass"
done

