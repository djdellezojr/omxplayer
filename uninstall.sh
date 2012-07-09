#!/bin/bash -x
FILES=`tar tf omxplayer-dist.tar.gz`
if [ -z "${FILES}" ]; then exit; fi;
for FILE in ${FILES} 
do 
	[ ! -d ${FILE} ] && rm -f /${FILE}; 
done

