# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="edvardm"

setopt correct
setopt autocd

# Disable marking untracked files under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git sudo fzf-tab command-not-found zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-bat)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# VI MODE
set -o vi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=earse
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.


[ "$TERM" = "xterm-kitty" ] && alias ssh='kitty +kitten ssh' # fix ssh in kitty
alias venv='virtualenv .venv --download'
alias ofd='open .'
alias lg='lazygit'
alias l='eza -lh --icons=always'
alias ls='eza -1 --icons=always'
alias ll='eza -lha --icons=always --sort=name --group-directories-first'
alias ld='eza -lhD --icons=always'
alias lt='eza --icons=always --tree'
alias v='echo "use nvim"'
alias src='source ~/.zshrc'
alias esrc='nvim ~/.zshrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ff='fastfetch --config examples/11'
alias oo='cd ~/vaults/Core/'
alias or='nvim ~/vaults/Core/inbox/*.md'

# ghostty ssh fix
if [[ "$TERM" == "xterm-ghostty" ]]; then
    alias ssh='TERM=xterm-256color ssh'
fi

# tmux-sessionizer
alias tmux-sessionizer="$HOME/tmux-sessionizer/tmux-sessionizer"
bindkey -s '^f' "tmux-sessionizer\n"

# Default editor
export EDITOR=nvim

# cargo path
export PATH="$HOME/.cargo/bin:$PATH"

# python path
export PATH="$HOME/Library/Python/3.13/bin:$PATH"

# Shell integrations
source <(fzf --zsh)
eval "$(zoxide init zsh --cmd cd)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# load env
[ -f ~/.openai_env ] && source ~/.openai_env

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Yazi shell wrapper
# allows changing cwd when exiting
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# fzf
export FZF_DEFAULT_COMMAND='fd --hidden --exclude Library --exclude Applications --exclude ".cache"' # fzf will use fd, inculding hidden and excluding large folders
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/kyle/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
