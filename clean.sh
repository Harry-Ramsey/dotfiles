#!/bin/bash
for directory in */; do
	echo "Removing $directory"
	stow -D --target=$HOME $directory
done
