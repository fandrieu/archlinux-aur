#!/bin/sh
kernel=3.6
gitname="aufs3-${kernel}_$(date +%Y%m%d)"
git clone git://aufs.git.sourceforge.net/gitroot/aufs/aufs3-standalone.git "$gitname"
cd "$gitname"
git checkout "origin/aufs${kernel}"
rm -rf .git
cd ..
lastgitname="aufs3-${kernel}_$(grep AUFS_VERSION "$gitname/include/linux/aufs_type.h" |sed 's/^.*-\([0-9]*\)"$/\1/')"
if [ -e "$lastgitname.tar.gz" ];then
 echo 'Up-to-date, nothing done.'
 rm -rf "$gitname"
 exit
fi
mv "$gitname" "$lastgitname"
tar czvf "$lastgitname.tar.gz" "$lastgitname" "$0"
