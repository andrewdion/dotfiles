#!/bin/bash

git pull
secrets_dir=/home/adion/.secrets
mkdir -p $secrets_dir
gpg secrets.tgz.gpg
mv secrets.tgz $secrets_dir
pushd $secrets_dir
tar -xf secrets.tgz
rm secrets.tgz
popd

# old way
#git pull
#secrets_dir=$(mktemp -d -p /tmp secrets.XXX)
#cp secrets.tgz.gpg $secrets_dir
#cd $secrets_dir
#mkdir secrets
#gpg secrets.tgz.gpg
#mv secrets.tgz secrets
#cd secrets
#tar -xf secrets.tgz
#rm secrets.tgz
#ls -l
