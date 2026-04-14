# -------------------------------
# Zsh Core Setup
# -------------------------------

# Enable completion system (once, with cache)
autoload -Uz compinit
compinit -C

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# -------------------------------
# Prompt (Minimal + Colored)
# -------------------------------
autoload -Uz colors && colors
autoload -Uz vcs_info

precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'

setopt PROMPT_SUBST
PROMPT='%F{cyan}%1~%f%F{magenta}${vcs_info_msg_0_}%f %F{yellow}\$%f '

# Better completion behavior
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

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

  # FIX: Moved inside load_gvm so go is available after gvm sources
  export GOROOT="$(go env GOROOT 2>/dev/null || echo /usr/local/go)"
  path_add "$GOROOT/bin"
}
gvm() { load_gvm; gvm "$@"; }
go()  { load_gvm; go "$@"; }

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
# History Settings
# -------------------------------
# FIX: Replaced bash-only HISTCONTROL with proper zsh history config
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

# -------------------------------
# Wi-Fi Aliases
# -------------------------------
alias wifion="nmcli radio wifi on"
alias wificonnect="nmcli device wifi connect CMF"

. "$HOME/.local/bin/env"

# -------------------------------
# Plugins
# -------------------------------
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
