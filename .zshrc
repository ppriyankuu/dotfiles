# -------------------------------
# Oh My Zsh Configuration (Core)
# -------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

# Load Oh My Zsh once (don’t reload every command)
source "$ZSH/oh-my-zsh.sh"

# -------------------------------
# Fast PATH Management
# -------------------------------
path_add() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"
}

# -------------------------------
# Bun Configuration
# -------------------------------
export BUN_INSTALL="$HOME/.bun"
path_add "$BUN_INSTALL/bin"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun" &!

# -------------------------------
# pnpm Configuration
# -------------------------------
export PNPM_HOME="$HOME/.local/share/pnpm"
path_add "$PNPM_HOME"

# -------------------------------
# Go Configuration (via gvm)
# -------------------------------
export GOPATH="/usr/local/go-workspace"

# Lazy load gvm + go only when used
load_gvm() {
  unset -f gvm go
  [ -s "$HOME/.gvm/scripts/gvm" ] && source "$HOME/.gvm/scripts/gvm"
}
gvm() { load_gvm; gvm "$@"; }
go()  { load_gvm; go "$@"; }

# Add static Go paths (these don’t slow startup)
if command -v go >/dev/null 2>&1; then
  export GOROOT="$(go env GOROOT 2>/dev/null || echo /usr/local/go)"
  path_add "$GOROOT/bin"
fi
path_add "$GOPATH/bin"

# -------------------------------
# NVM Lazy Loading (Fast Startup)
# -------------------------------
export NVM_DIR="$HOME/.nvm"

load_nvm() {
  unset -f nvm node npm npx pnpm tsc

  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

  # Automatically use default version silently
  nvm use default >/dev/null 2>&1
}

nvm()  { load_nvm; nvm "$@"; }
node() { load_nvm; node "$@"; }
npm()  { load_nvm; npm "$@"; }
pnpm()  { load_nvm; pnpm "$@"; }
npx()  { load_nvm; npx "$@"; }
tsc()  { load_nvm; tsc "$@"; }

# -------------------------------
# Zsh Completion Optimization
# -------------------------------
autoload -Uz compinit
compinit -C  # Uses cache for faster startup
zstyle ':completion:*' rehash true

# -------------------------------
# History Settings
# -------------------------------
HISTCONTROL=ignoreboth

# -------------------------------
# Wi-Fi Aliases
# -------------------------------
alias wifion="nmcli radio wifi on"
alias wificonnect="nmcli device wifi connect CMF"

# bun completions
[ -s "/home/ppriyankuu/.bun/_bun" ] && source "/home/ppriyankuu/.bun/_bun"

. "$HOME/.local/bin/env"
