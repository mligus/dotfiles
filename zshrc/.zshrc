# === Default editor ===

export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="$EDITOR"


# === History config ===
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history


# === General config ===
bindkey -v  # set to Vim key bindings
unsetopt beep

# === Completion config ===

zstyle :compinstall filename '/home/ml/.zshrc'
autoload -Uz compinit && compinit

# === My aliases ===

source $HOME/.zshaliases


# === Starship config ===

eval "$(starship init zsh)"


# === NVM and Node.js (for NeoVim LSP mostly) ===

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# === Fuzzy Find ===

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# === Plugins (with zplug) ===

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load
