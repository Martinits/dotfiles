# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/martinit/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

plugins=( git
          zoxide
          sudo
          zsh-autosuggestions
          zsh-syntax-highlighting
          colored-man-pages
          copyfile
          cp
          dircycle
          history
        )

source $ZSH/oh-my-zsh.sh

# User configuration

export LC_ALL="en_US.UTF-8"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# aliases
alias la='ls -lAF'
alias ll='ls -l'
alias lh='ls -lh'
alias lt='ls -lht'
alias rr='\rm -rv'
alias rf='\rm -rfv'
alias rm='echo "Do you really want RM ??? Use th to trash!"; false'
alias th='trash'
alias thp='trash-put'
alias thl='trash-list'
alias the='trash-empty'
alias thr='trash-restore'
alias thrm='trash-rm'
alias sudo='sudo -E '
alias sd='sudo -E '
alias sdn='shutdown -h now'
alias rbt='reboot'
alias .1='..'
alias .2='...'
alias .3='....'
alias .4='.....'
alias .5='......'
alias ra='ranger'
alias v='vim'
alias cat='bat'
alias dud='du -hd1'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'
alias md='mkdir -vp'
alias cs='cowsay'
alias ft='figlet'
alias gaa='git add -A'
alias gpl='git pull'
alias gp='git push'
alias gc='git commit -vm'
alias gd='git diff'
alias gs='git status'
alias scrot='scrot -z'

# shell functions
source ~/.func.zsh

# config for specific machines
if [ -f ~/.zshrc.thismachine ] ; then
	source ~/.zshrc.thismachine
fi

# load p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# command history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# zsh options
setopt autocd beep extendedglob notify nonomatch
bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '^f' forward-word
bindkey '^b' backward-word

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[5 q'
}
_fix_cursor() {
    echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

# The following lines were added by compinstall
# zstyle :compinstall filename '/home/martinit/.zshrc'
# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# calc.plugin.zsh
source $HOME/.oh-my-zsh/plugins/calc/calc.plugin.zsh

# bat
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

# zsh-autocomplete
#zstyle ':autocomplete:*' recent-dirs zoxide
#zstyle ':autocomplete:*' fzf-completion yes
#source ~/.zsh-plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# fzf
source ~/.fzf.zsh
