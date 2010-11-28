autoload -U compinit
compinit

setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars

# list
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'

# bundler
alias b='bundle1.8'
alias be='b exec'
alias bi='b install'
alias ber='be rspec'
alias bu='bundle'
alias bue='bundle exec'
alias bui='bundle install'

# rails
alias r='rails1.8'
alias ra='rails'

# rake
alias rake_db_seed='rake db:seed'
alias rake_db_migrate='rake db:migrate'
alias rake_db_migrate_test='rake db:migrate RAILS_ENV=test'
alias rds='rake_db_seed'
alias rdm='rake_db_migrate'
alias rdmt='rake_db_migrate_test'

# others
alias e='exit'
alias g='git'
alias gi='git'
alias s='svn'
alias sc='screen -U'
alias up='cd ..'

PROMPT='%n@%m:%(5~,%-2~/.../%2~,%~)%# '
