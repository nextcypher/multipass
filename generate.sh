#!/bin/sh

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

if [ ! -f ./gen-txt ]
then
	echo "Error: gen-txt not found.  Please build it."
	exit 1
fi

./gen-txt
./stamp-all.sh $N
./encrypt-all.sh $N
./gen-sums.sh
./extract-all.sh $N
./check-all.sh $N

