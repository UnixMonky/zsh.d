if [[ $(type -p lsd) ]]; then
  alias ls='lsd'
  alias ll='lsd -l'
  alias la='lsd -a'
  alias lla='lsd -la'
  alias lt='lsd --tree'
  alias lltr='lsd -lAtr'
else
  LS_OPTIONS=()
  LS_OPTIONS+=(-F)             # add / to directories
  LS_OPTIONS+=(--color=auto)   # colorize
  LS_OPTIONS+=(-h)             # human readable file sizes
  LS_OPTIONS+=(-H)            # follow symlinks
  alias ls='ls $LS_OPTIONS'
  alias ll="ls $LS_OPTIONS -l"
  alias la="ls $LS_OPTIONS -A"
  alias lla="ls $LS_OPTIONS -lA"
  alias lltr="ls $LS_OPTIONS -lAtr"
fi
alias grep='grep --color=auto'  ## grep coloring
alias vi='/bin/vim'            ## vim instead of vi
alias ducks='du -cksh * | sort -hr | head -n 15'  ## sorting alias
