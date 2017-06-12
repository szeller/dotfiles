
export JAVA_HOME=`/usr/libexec/java_home`
# export PATH=$JAVA_HOME/bin:$PWD/node_modules/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# export PATH=$JAVA_HOME/bin:`brew --prefix ruby`/bin:`brew --prefix go`/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin::/usr/X11/bin:/usr/local/share/npm/bin
export PATH=$JAVA_HOME/bin:`brew --prefix go`/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# export FINDBUGS_HOME=`brew --prefix findbugs`/libexec
# export ANT_OPTS='-XX:MaxPermSize=256m -Xms512m -Xmx1024m'
# export MAVEN_OPTS=$ANT_OPTS
# export GROOVY_HOME=`brew --prefix groovy`/libexec
export NVM_DIR=~/.nvm
export HISTIGNORE="&:ls:[bf]g:exit:git status"
export HISTAPPEND=1

source $(brew --prefix nvm)/nvm.sh 
complete -C aws_completer aws

# if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
#   . $(brew --prefix)/share/bash-completion/bash_completion
# fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion

  # turn on some extra options for git prompts
  export GIT_PS1_SHOWDIRTYSTATE=1
  # export GIT_PS1_SHOWUPSTREAM=1
  # export GIT_PS1_SHOWSTASHSTATE=1
  # export GIT_PS1_SHOWUNTRACKEDFILES=1

  export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

function list_git_branch {
 git br --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'
}

alias g='git'
alias gl='git l'
alias gitback='git br -f $(list_git_branch)_backup'

alias known_hosts='cat ~/.ssh/known_hosts | sed "s/\([^, ]*\).*/\1/"'

