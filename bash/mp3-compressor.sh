#!/bin/bash

#brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools

for f in $(find ./ -name '*.mp3');
do echo "-------------------------- "
	echo "Converting $f"
	bn=`basename $f .mp3`
	echo "Basename $bn extracted"
	dn=`dirname $f`
	echo "Dirname $dn extracted"
	tfmp3="$dn/__$bn.mp3"
	fogg="$dn/$bn.ogg"
	rm $fogg;
	echo "Removed $fogg file"
	mv $f $tfmp3;
	echo "Temporary $tfmp3 created"
	ffmpeg -i $tfmp3 -ab 64k $f || echo FAILED;
	ffmpeg -i $tfmp3 -f ogg -acodec libvorbis -ab 64k $fogg || echo FAILED;
	rm $tfmp3;
	echo "Temporary $tfmp3 deleted"
	echo "Converted $f sucessful"
	echo "--------------------------"
done;
