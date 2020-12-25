# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Reduce the lag when switching edit modes
export KEYTIMEOUT=1

# Enable history search with `Ctrl + R`
bindkey    "^R"     history-incremental-pattern-search-backward

# Delete (forward) character iTerm2 OSX
# https://stackoverflow.com/questions/33270381
bindkey    "^[[3~"  delete-char
bindkey    "^[3;5~" delete-char

source ~/dotfiles/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh

# Local config
[[ ! -f ~/dotfiles/zsh/.zshrc.local ]] || source ~/dotfiles/zsh/.zshrc.local

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    alias ls='ls -G'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias la='ls -alF'
alias ll='ls -alF'
alias l='ls -CF'

source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
