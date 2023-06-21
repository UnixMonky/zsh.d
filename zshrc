## Used for setting user's interactive shell configuration and executing
## commands, will be read when starting as an interactive shell.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh-autocomplete - not use we hate this
# source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob
bindkey -v
set -o vi
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
# zstyle :compinstall filename '${HOME}/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall
# autoload bashcompinit && bashcompinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Set unique history files
[[ ! -d ${HOME}/.history ]] && mkdir ${HOME}/.history
export HISTFILE=${HOME}/.history/hist_$$
export HISTSIZE=1024

## Always use vim as our editor
export VISUAL=vim
export EDITOR=vim

## oh-my-zsh
export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom"
# zmodload zsh/mapfile
case "${(L)$(hostname -s)}" in
  "matts-mbp" )  plugins=(vi-mode zsh-autosuggestions zsh-aws-vault docker docker-compose minikube kubectl) ;;
  "hestu"  )  plugins=(vi-mode zsh-autosuggestions) ;;
esac
# plugins=(zsh-syntax-highlighting zsh-autosuggestions vi-mode zsh-aws-vault docker docker-compose)
source $ZSH/oh-my-zsh.sh

## powerlevel10k theme
if [[ $(uname -s) == "Darwin" ]]; then
  source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
else
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

## autocompletes
complete -C $(type -p aws_completer) aws

## unset any automatic paging that has been seet
unset PAGER

###
# Aliases
###
if [[ $(command -v lsd) ]]; then
  alias ls='lsd'
  alias ll='lsd -l'
  alias la='lsd -a'
  alias lla='lsd -la'
  alias lt='lsd --tree'
  alias lltr='lsd -lAtr'
else
  LS_OPTIONS=()
  LS_OPTIONS+=(-F)             # add / to directories
#  LS_OPTIONS+=(--color=auto)   # colorize
  LS_OPTIONS+=(-h)             # human readable file sizes
  LS_OPTIONS+=(-H)            # follow symlinks
  alias ls='ls $LS_OPTIONS'
  alias ll="ls $LS_OPTIONS -l"
  alias la="ls $LS_OPTIONS -A"
  alias lla="ls $LS_OPTIONS -lA"
  alias lltr="ls $LS_OPTIONS -lAtr"
fi

if [[ -f ${ZSH_D}/dircolors ]]; then
  eval "$(dircolors ${ZSH_D}/dircolors)"
else
  eval "$(dircolors)"
fi

[[ -f ${ZSH_D}/zalias ]] && . ${ZSH_D}/zalias

if [[ $(uname -s) == "Darwin" ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## End of configuration. Anything below this was added by an external process and need to be adjusted
