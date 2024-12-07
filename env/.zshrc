export ZSH="$HOME/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

ZSH_THEME="robbyrussell"
setopt HIST_SAVE_NO_DUPS
# setting vim keybindings
bindkey -v

plugins=(
    zsh-autosuggestions
)

bindkey '^y' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# TODO: fix
export DEV_ENV_HOME="$HOME/personal/dev"
export PATH="$PATH:$HOME/.local/bin"

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
export EDITOR="nvim"
export VISUAL="nvim"
export KEYTIMEOUT=1


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# cargo
. "$HOME/.cargo/env"

# tmux-sessionizer
alias ts="tmux-sessionizer"
bindkey -s '^f' "tmux-sessionizer\n"

autoload -U compinit; compinit

