# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


if ! shopt -oq posix; then
    if [[ $(uname -s) = "Darwin" ]] ; then
        # shellcheck disable=SC1090
        . "$(brew --prefix)/etc/bash_completion"
    elif [ -f /usr/share/bash-completion/bash_completion ]; then
        # shellcheck disable=SC1091
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        # shellcheck disable=SC1091
        . /etc/bash_completion
    fi
fi

export MANROFFOPT='-c'
export LESS='-RFX'
export CLICOLOR=1
[[ $(command -v emacssclient) ]] && export EDITOR=emacsclient
[[ $(command -v bat) ]] && export MANPAGER="sh -c 'col -bx | bat -l man -p'"
[[ $(command -v mdv) ]] && export MDV_THEME=665.1971


bold=$(tput bold)
normal=$(tput sgr0)

#shellcheck disable=SC2034
GIT_PS1_SHOWDIRTYSTATE=true
printf -v PS1 '%s\w%s$(__git_ps1)\n\$ ' "$bold" "$normal"

# shellcheck disable=SC1090
[[ -f "$HOME/.bashrc.local" ]] && . "$HOME/.bashrc.local"
