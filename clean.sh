#!/bin/bash
for directory in */; do
	echo "Removing $directory"
	stow -D --target=$HOME $directory
done

cache_path=("${HOME}/.cache/nvim" "${HOME}/.local/share/nvim")

for directory in ${cache_path[@]}; do
	echo "Removing $directory"
	rm -rf $directory
done
