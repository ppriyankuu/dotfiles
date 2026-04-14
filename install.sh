#!/bin/bash

echo "Setting up dotfiles..."

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.vimrc ~/.vimrc 2>/dev/null

echo "Done!"
