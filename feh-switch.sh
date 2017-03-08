#!/bin/bash

dir=/home/adion/wallpapers
file=$(ls $dir | sort -R | head -1)
ln -sf $dir/$file $dir/.active
