#!/bin/bash

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo $HOME/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar -C $HOME -xf $HOME/lazygit.tar.gz lazygit
sudo install $HOME/lazygit /usr/local/bin
rm $HOME/lazygit $HOME/lazygit.tar.gz
