#      __               __
#     / /_  ____ ______/ /_  __________
#    / __ \/ __ `/ ___/ __ \/ ___/ ___/
# _ / /_/ / /_/ (__  ) / / / /  / /__
#(_)_.___/\__,_/____/_/ /_/_/   \___/

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Put your fun stuff here.

LOCAL_BIN=${HOME}/.local/bin
if [[ -d ${LOCAL_BIN} ]]; then
    export PATH=${LOCAL_BIN}:${PATH}
fi

alias lla="ls -la"
alias ll="ls -l"
alias llr="ls -laRh"

complete -cf sudo
complete -cf man

export EDITOR=vim

. /usr/share/bash-completion/bash_completion
