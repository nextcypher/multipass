#!/bin/bash

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

PASSPHRASE=`cat ./.common_pass`

for (( n=1; n<=$N; n++ ))
do
	NUM=`printf '%04u' $n`
	KF="keydata/$NUM.key"

	echo "$PASSPHRASE $NUM" > $KF
done
