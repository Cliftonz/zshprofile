#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
FILES=(.zshrc .zprofile .zshenv)

for file in "${FILES[@]}"; do
  target="$HOME/$file"
  source="$DOTFILES_DIR/$file"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "Backing up existing $target to ${target}.backup"
    mv "$target" "${target}.backup"
  fi

  ln -sf "$source" "$target"
  echo "Linked $target -> $source"
done

echo ""
echo "Done! Restart your shell or run: source ~/.zshrc"
echo ""
echo "Tip: Use ~/.zshrc.local, ~/.zprofile.local, or ~/.zshenv.local"
echo "     for machine-specific config that won't be committed."
