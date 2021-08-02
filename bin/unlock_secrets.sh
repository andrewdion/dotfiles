#!/bin/bash

git pull
SECRETS_DIR=/home/adion/.secrets
rm -fr $SECRETS_DIR
mkdir $SECRETS_DIR
gpg secrets.tgz.gpg
mv secrets.tgz $SECRETS_DIR
cd $SECRETS_DIR
tar -xf secrets.tgz
rm secrets.tgz
