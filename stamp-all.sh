#!/bin/bash

if [ $# -eq 0 ]
then
	N=1138
else
	N=$1
fi

INF=NXC-MultiPass-300dpi.jpg

OUT_FONT=Times-Bold
OUT_FONT_SZ=300

for (( n=1; n<=$N; n++ ))
do
	NUM=`printf '%04u' $n`
	OUTF="jpgdata/$NUM.jpg"

	convert $INF -font $OUT_FONT -pointsize $OUT_FONT_SZ \
		-draw "gravity southwest \
       	          fill black  text 140,172 '$NUM' \
       	          fill white  text 141,171 '$NUM' \
       	          fill black  text 5500,172 '$NUM' \
       	          fill white  text 5501,171 '$NUM' " \
		$OUTF

	echo "Wrote $OUTF"
done

