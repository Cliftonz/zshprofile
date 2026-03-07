# --- Homebrew ---
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# --- Ngrok completions ---
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# --- MacPorts (uncomment if needed) ---
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# --- Machine-specific overrides ---
[ -f "$HOME/.zprofile.local" ] && source "$HOME/.zprofile.local"
