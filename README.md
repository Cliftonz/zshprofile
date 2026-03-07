# zshprofile

Portable zsh configuration synced across machines.

## Setup on a new machine

```bash
git clone <repo-url> ~/zshprofile
cd ~/zshprofile
chmod +x install.sh
./install.sh
```

This symlinks `.zshrc`, `.zprofile`, and `.zshenv` to your home directory (backing up any existing files first).

## Machine-specific config

For settings that vary per machine (work paths, local tools, etc.), create any of these files — they're sourced automatically but not tracked by git:

- `~/.zshrc.local`
- `~/.zprofile.local`
- `~/.zshenv.local`

## What's included

- Oh My Zsh with git plugin
- Clipboard aliases (`c` / `p`)
- `gacp` function for quick git add/commit/push
- NVM, pnpm, Kubernetes, Docker completions
- Homebrew auto-detection (Apple Silicon + Intel)
- Cargo/Rust environment
