#!/usr/bin/bash

rm -rf ~/.config/nvim/
mkdir -p ~/.config/ ~/.config/nvim/

shopt -s dotglob nullglob

cd .. && mv nvim/* ~/.config/nvim/
rm -rf nvim/
