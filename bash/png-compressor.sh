#!/bin/bash

#brew install pngquant

for f in $(find ./ -name '*.png');
do echo "-------------------------- "
	echo "Compressing $f"
	bn=`basename $f .png`
	echo "Basename $bn extracted"
	dn=`dirname $f`
	echo "Dirname $dn extracted"
	pngquant -f  -v $f -o $f
	echo "$f compressed sucessful"
	echo "--------------------------"
done;
