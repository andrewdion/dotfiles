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
