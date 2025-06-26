# .bashrc - Run once for every user shell!

stty -ixon # Disable ctrl-s and ctrl-q.
HISTSIZE= HISTFILESIZE= # Infinity history.
mkdir -p ~/.history && touch ~/.history/history
export HISTFILE=/home/$USER/.history/history #Out of sight, out of mind. >.<
export GPG_TTY=$(tty)

# Autocompletion in interactive shells for posix compliant commands (https://askubuntu.com/a/209894)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Coloring
PS1="\[\e[38;5;198m\][\[\e[38;5;213m\]\u\[\e[38;5;201m\]@\[\e[38;5;177m\]\h \[\e[38;5;135m\]\w\[\e[38;5;198m\]]\[\e[0m\] \$ "

#Aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias clip="perl -pe 'chomp if eof' | xclip -sel clip"
alias grep="grep --color"
