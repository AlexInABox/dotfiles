#!/bin/bash
# This script creates symbolic links for dotfiles in the user's home directory.

DOTFILES_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for f in "$DOTFILES_DIR"/.*; do
  [[ -f "$f" && "$(basename "$f")" =~ ^\.[^.]+$ ]] && ln -sf "$f" ~/
done

# Link mutt-temp to /usr/local/share/mutt-wizard/mutt-temp
sudo mkdir -p /usr/local/share/mutt-wizard
sudo ln -sf "$DOTFILES_DIR/mutt-wizard/mutt-temp" /usr/local/share/mutt-wizard/mutt-temp
