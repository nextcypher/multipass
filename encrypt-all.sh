#!/bin/bash

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

for (( n=1; n<=$N; n++ ))
do
	EF=`printf 'jsondata/%04u.json' $n`
	ENCF=`printf 'jpgdata/%04u.jpg' $n`
	#echo "$EF -> $ENCF"

	steghide embed -ef $EF -cf $ENCF -p "nextcypher multipass"
done

