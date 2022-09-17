#!/bin/bash

INF=NXC-MultiPass-300dpi.jpg
N=1138

for (( n=1; n<=$N; n++ ))
do
	EF=`printf 'jsondata/%04u.json' $n`
	ENCF=`printf 'jpgdata/%04u.jpg' $n`
	#echo "$EF -> $ENCF"

	steghide embed -ef $EF -cf $INF -p "nextcypher multipass" -sf $ENCF
done

