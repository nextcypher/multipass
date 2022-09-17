#!/bin/sh

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

./gen-txt
./stamp-all.sh $N
./encrypt-all.sh $N
./gen-sums.sh
./extract-all.sh $N
./check-all.sh $N

