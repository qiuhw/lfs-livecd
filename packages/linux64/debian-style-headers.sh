#!/bin/sh

KVERSION=`grep UTS_RELEASE include/linux/utsrelease.h | cut -d '"' -f 2`
DSTDIR=/usr/src/linux-$KVERSION

rm -rf "$DSTDIR"
mkdir "$DSTDIR"
cp -r .config Makefile Module.symvers .version scripts "$DSTDIR"
mkdir -p "$DSTDIR/include"
find include -maxdepth 1 | grep -v asm- | xargs '-I{}' cp -r '{}' "$DSTDIR/include"
cp -r include/asm-{i386,x86_64,generic} "$DSTDIR/include"
find . -type f -a '(' -name Kconfig\* \
    -o -name Makefile\* -o -name \*.s ')' | (
	while read file ; do
	    case "$file" in
		./arch/x86_64*|./include/asm-generic*|./include/asm-i386*|./include/asm-x86_64*)
		    mkdir -p "$DSTDIR/`dirname $file`"
		    cp "$file" "$DSTDIR/$file"
		    ;;
		./arch/*|./include/asm-*)
		    ;;
		*)
		    mkdir -p "$DSTDIR/`dirname $file`"
		    cp "$file" "$DSTDIR/$file"
		    ;;
	    esac
	done )
ln -nsf "$DSTDIR" "/lib/modules/$KVERSION/source"
ln -nsf "$DSTDIR" "/lib/modules/$KVERSION/build"
