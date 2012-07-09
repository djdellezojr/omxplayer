#!/bin/bash -x
if [ ! -e omxplayer-dist.tar.gz ]; then exit; fi;
FILES=`tar tf omxplayer-dist.tar.gz`
if [ -z "${FILES}" ]; then exit; fi;
for FILE in ${FILES} 
do 
	[ ! -d ${FILE} ] && rm -f /${FILE}; 
done

