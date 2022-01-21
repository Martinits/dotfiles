# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/martinit/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

lc(){
    if (( $# == 0 ));
    then
        ls | wc -l
    else
        ls "$1" | wc -l
    fi
}

lac(){
    if (( $# == 0 ));
    then
        echo $[ `la | wc -l` - 1 ]
    else
        echo $[ `la "$1" | wc -l` - 1 ]
    fi
}

up(){
    local old=`pwd`
    for i in $(seq "${1:-1}"); do
        old="${old%/*}"
        if [ -z "$old" ]; then
            break
        fi
    done
    if [ -z "$old" ]; then
        old='/'
    fi
    cd "$old"
}

mkcd(){
    mkdir -vp $1 && cd $1
}

dumpinto(){
    if (( $# == 0 )); then
        echo Need one argument
        return 1
    fi
    if (( $# > 1 )); then
        echo Too many arguments
        return 1
    fi
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
    if (( `ls "$1" | wc -l` > 0 )); then
        echo Directory "$1" exists and not empty
        return 1
    fi
    ls -A | grep -v "^$1$" | xargs -I file mv file "$1"
}

swap(){
    if (( $# != 2 )) ; then
        echo "Exact 2 command line arguments needed!" >&2
        return 1
    fi
    local tmpnames=(tmp.$$ .tmp.$$ tmp temp .tmp .temp)
    for ((i = 1; i <= $#tmpnames; i++)) ; do
        if [ ! -f "$i" ] ; then
            mv "$1" $tmpnames[i] && mv "$2" "$1" && mv $tmpnames[i] "$2"
            return 0
        fi
    done
    echo "tmpfile names are all in conflict!" >$2
    return 1
}

if [ -f ~/.zshrc.thismachine ] ; then
	source ~/.zshrc.thismachine
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob notify nonomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/martinit/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# https://github.com/arzzen/calc.plugin.zsh
source $HOME/.oh-my-zsh/plugins/calc/calc.plugin.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

#env export
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"
export LC_ALL="en_US.UTF-8"
