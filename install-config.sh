#!/bin/bash

DIR=$HOME/.config/nvim

if [ ! -d $DIR ]; then
	mkdir -p $DIR
	mkdir -p $DIR/lua
fi

cp init.lua $DIR
cp -r lua/* $DIR/lua

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
