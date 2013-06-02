#!/bin/sh
gitname="aufs3-util-$(date +%Y%m%d)"
git clone git://git.code.sf.net/p/aufs/aufs-util "$gitname"
cd "$gitname"
git checkout origin/aufs3.0
lastgitname="aufs3-util-$(date -d @$(git log -n1 --pretty=format:%ct) '+%Y%m%d')"
rm -rf .git
cd ..
if [ -e "$lastgitname.tar.gz" ];then
 echo 'Up-to-date, nothing done.'
 rm -rf "$gitname"
 exit
fi
mv "$gitname" "$lastgitname"
tar czvf "$lastgitname.tar.gz" "$lastgitname" "$0"
