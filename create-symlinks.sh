#!/bin/bash
# Create symlinks for dotfiles (files only, no directories)

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

for f in "$DOTFILES_DIR"/.*; do
  [[ -f "$f" && ! -d "$f" && "$(basename "$f")" =~ ^\.[^.]+$ ]] || continue
  ln -sf "$f" "$HOME/$(basename "$f")"
done
