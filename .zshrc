# =============================================================================
# Zsh Profile - Portable configuration synced across machines
# =============================================================================

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# --- PATH ---
export PATH="$HOME/.local/bin:$PATH"

# --- Clipboard ---
alias c='pbcopy'
alias p='pbpaste'

# --- Git ---
gacp() {
  git config --global push.autoSetupRemote true
  git add -A
  git commit -m "$1"
  git push
}

# --- NVM ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Kubernetes ---
alias t='talosctl'
alias k='kubectl'
alias kgc='kubectl get contexts'
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# --- Docker CLI completions ---
if [ -d "$HOME/.docker/completions" ]; then
  fpath=($HOME/.docker/completions $fpath)
  autoload -Uz compinit
  compinit
fi

# --- pnpm ---
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- Java / Android (uncomment if needed) ---
# export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
# export PATH="$JAVA_HOME/bin:$PATH"
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# --- Auto-update dotfiles ---
if [ -d "$HOME/zshprofile/.git" ]; then
  git -C "$HOME/zshprofile" pull --quiet &>/dev/null &!
fi

# --- Machine-specific overrides ---
# Source a local file for per-machine config that shouldn't be committed
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/zacclifton/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
