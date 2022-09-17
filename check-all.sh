#!/bin/bash

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

RC=0
for (( n=1; n<=$N; n++ ))
do
	OF=`printf 'jsondata/%04u.json' $n`
	XF=`printf 'checkdata/%04u.json' $n`
	#echo "$EF -> $ENCF"

	if ! cmp -l $OF $XF
	then
		echo "CMP FAILED: $OF vs $XF"
		RC=1
	fi
done

exit $RC

