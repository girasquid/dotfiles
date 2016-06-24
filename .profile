if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
 
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
 
export PS1='\[\033[0;35m\]\w\[\033[0;36m\]$(parse_git_branch)\[\e[0m\]: '
ssh-add

alias g='git'
alias gdf='g diff | subl'
alias branch='git rev-parse --abbrev-ref HEAD'

alias be="bundle exec"

# # Air dev
# export PATH="/Applications/Adobe Gaming SDK 1.4/AIR SDK/bin:$PATH"
# # ^^ Adds adt, adl, mxmlc to $PATH
# export AIR_SDK_HOME="/Applications/Adobe Gaming SDK 1.4/AIR SDK"
# # ^^ Adds the root of the AIR SDK so that it can load the java libs it needs

# Air dev
export PATH="/Users/luke/projects/flash/toolchain/air-sdk/bin:$PATH"
# ^^ Adds adt, adl, mxmlc to $PATH
export AIR_SDK_HOME="/Users/luke/projects/flash/toolchain/air-sdk"
# ^^ Adds the root of the AIR SDK so that it can load the java libs it needs

# Because I type make twice a lot
alias makemake='make'
alias rt='ruby -Itest'
# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Postgres binaries, for installing do_postgres
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# Android dev
export ANDROID_HOME=/Users/luke/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export EDITOR=vim
export GEM_EDITOR=subl
export BUNDLER_EDITOR=subl
