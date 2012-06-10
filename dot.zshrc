# ----------------------------------------------------------------------
# Complement
# ----------------------------------------------------------------------
# Command complemention e.g. ls -[tab] then list options
autoload -U compinit
compinit

# Colorize completion list e.g. ls [tab]
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ----------------------------------------------------------------------
# History
# ----------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups # Ignore duplicated command of history
setopt share_history # Share history between terminals by HISTFILE

# ----------------------------------------------------------------------
# screen
# ----------------------------------------------------------------------
# Show previous-typed command to title
# Not to show lengthy title, show only command and a first arg if exists
preexec() {
  if [ $TERM = "screen" ]; then # Not to show previous-typed command on not screen
    command="${(z)2}"
    array=(`echo $command`) # String to Array
    title=(`echo "$array[1] $array[2]" | cut -c1-10`)
    echo -ne "\ek[$title]\e\\"
  fi
}

# ----------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle open'

alias du='du -h'

alias e='exit'

alias f='find'

alias g='git'

alias h='cd ~' # to Home

alias j='jobs -l'

alias l='ls'
alias la='ls -A'
alias ll='ls -l'
alias ls='ls -FG'

alias n='netstat -tuna'

alias o='open'

alias p='ps auxxx'

alias r='rails'
alias rc='rails c'
alias reload='source ~/.zshrc'
alias rs='rails s'

alias s='svn'
alias sc='screen -U'
alias screen='screen -U'
alias sl='ls' # Hedge typo

alias v='vim'

# http://d.hatena.ne.jp/mollifier/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  alias -g C='| putclip'
fi

alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sort'
alias -g T='| tail'
alias -g V='| view - -R'
alias -g VR='| view - -R'

# ----------------------------------------------------------------------
# Others
# ----------------------------------------------------------------------
export EDITOR=vim
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad # Set color of ls

setopt auto_cd # cd-able without cd
setopt auto_pushd # cd-able to past directories by cd -[tab]
setopt correct # Correct wrong commands
setopt cdable_vars
setopt list_packed
setopt print_eight_bit # Print Japanese file name

setopt no_beep
setopt nolistbeep

# Emacs keybind on terminal
# *** Notice: If 'export EDITOR=vim', then automatically set 'bindkey -v'
bindkey -e

# Apply extracted files
source ~/.alias.zshrc
source ~/.prompt.zshrc
