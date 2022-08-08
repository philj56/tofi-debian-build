#!/bin/bash -e

version=0.4.0

pushd .

mkdir debbuild
cd debbuild

curl -L https://github.com/philj56/tofi/archive/v$version/tofi-$version.tar.gz -o tofi_$version.orig.tar.gz
tar xf tofi_$version.orig.tar.gz
cd tofi-$version

cp -r ../../debian .
cp LICENSE debian/copyright

grep -rlI TOFI_VERSION debian | xargs sed -i "s/TOFI_VERSION/$version/g"

debuild -us -uc

popd

mkdir -p tofi-debian
cp debbuild/*.deb tofi-debian
