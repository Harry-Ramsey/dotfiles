#!/bin/bash
mkdir -p $HOME/.config/

for directory in */; do
	echo "Stowing $directory"
	stow -D --target=$HOME $directory
	stow --target=$HOME $directory
done
