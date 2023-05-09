#!/bin/bash

DIR=$HOME/.config/nvim

if [ !-d $DIR ] then;
	mkdir -p $DIR
fi

cp init.lua $DIR
cp -R lua $DIR

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
