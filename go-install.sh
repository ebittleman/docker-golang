#!/bin/bash
set -e

DEST=/tmp
BASEURL=https://www.dropbox.com/s/lrfrqu480sbqll4
TARFILE=go1.4.2.linux-amd64.tar.gz

GOLIB=/usr/lib/golang
GOVERSION=go1.4.2
GOROOT=$GOLIB/golang

cwd=`pwd`

echo "INSTALL CURL"
apt-get install -q -y curl

echo "DOWNLOAD $BASEURL/$TARFILE TO $DEST/$TARFILE"
[[ -f $DEST/$TARFILE ]] || curl -s -L -o $DEST/$TARFILE $BASEURL/$TARFILE

echo "CREATE AND GO TO $GOLIB"
[[ -d "$GOLIB" ]] || mkdir -p $GOLIB
cd $GOLIB

[[ -d $GOVERSION ]] && rm -rf $GOVERSION

echo "EXTRACTING $DEST/$TARFILE TO $GOLIB/go"
tar -xzf $DEST/$TARFILE
rm -rf $DEST/$TARFILE

echo "MOVE TO go VERSION $GOVERSION"
mv go $GOVERSION

ln -sfn $GOLIB/$GOVERSION $GOROOT

cd $cwd
