#!/bin/bash

HOME=$(pwd)
URL="http://anduin.linuxfromscratch.org/files/BLFS/svn/xorg/driver-7.5-2.wget"
TMP=$(mktemp -d)
FILE=$(basename $URL)
cd $TMP && wget -q $URL

echo "# This file auto generated by $0" >> filelist

i=101
for file in $(grep -v '^#' $TMP/$FILE)
do
	wget -q http://dev.lightcube.us/~jhuntwork/sources/Xorg-driver/$file
	echo '' >> filelist
	echo "FILE$i= $file" >> filelist
	echo "URL-\$(FILE$i)= \$(URLBASE)/\$(FILE$i)" >> filelist
	echo "SUM-\$(FILE$i)= $(md5sum $file | awk '{print $1}')" >> filelist
	i=`expr $i + 1`
done

mv filelist $HOME
cd $HOME
rm -rf $TMP
