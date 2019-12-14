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
# Make tab title to show command executed previously.
preexec() {
  if [ $TERM = "screen" ]; then # For screen terminal only.
    command="${(z)2}"
    array=(`echo $command`) # String to Array.
    title=(`echo "$array[1] $array[2]" | cut -c1-10`) # Do not make title redundant.
    echo -ne "\ek[$title]\e\\"
  fi
}

# ----------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------
alias b='bundle install -j4'
alias be='bundle exec'
alias bo='bundle open'

alias e='exit'

alias g='git'

alias la='ls -A'
alias ll='ls -l'
alias ls='ls -FG'

alias n='netstat -tuna'

alias open-textedit='open -a TextEdit'

alias ps-update="git add . ; git commit -m 'update' ; git push origin HEAD"

alias sc='screen -U'
alias screen='screen -U'

alias sl='ls' # Hedge typo

alias v='vim'

# Define alias `C` for copying terminal output.
# example: `$ cat example.txt C`
# ref: http://d.hatena.ne.jp/mollifier/20100317/p1
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

# ----------------------------------------------------------------------
# Prompt
# ----------------------------------------------------------------------
setopt prompt_subst
autoload colors; colors

# Git info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b] (%a)'

precmd () {
  psvar=()
  vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT=$'%B%F{green}%n@%M%f %F{blue}%~%f%b%1(v| %F{yellow}%1v%f|)\n%B%F{blue}$%f%b '

# ----------------------------------------------------------------------
# Others
# ----------------------------------------------------------------------
export PATH=$HOME/.nodebrew/current/bin:$PATH # nodebrew
export EDITOR=vim
export LANG=ja_JP.UTF-8
export LSCOLORS=gxfxcxdxbxegedabagacad # Set color of ls
export HOMEBREW_MAKE_JOBS=3 # Increase the number of homebrew jobs (default is the number of CPUs)

# for MySQL v5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export DYLD_LIBRARY_PATH="/usr/local/opt/mysql@5.7/:$DYLD_LIBRARY_PATH"

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

stty -ixon # Enable Ctrl+S to forward search (combinating with Ctrl+R)

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

# Set key repeat
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
