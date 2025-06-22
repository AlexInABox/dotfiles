#!/bin/bash
# This script creates symbolic links for dotfiles in the user's home directory.

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for f in "$DOTFILES_DIR"/.*; do
  [[ -f "$f" && "$(basename "$f")" =~ ^\.[^.]+$ ]] && ln -sf "$f" ~/
done