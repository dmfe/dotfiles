#                      _____
#    _________  ____  / __(_)___ ______
#   / ___/ __ \/ __ \/ /_/ / __ `/ ___/
# _/ /__/ /_/ / / / / __/ / /_/ (__  )
#(_)___/\____/_/ /_/_/ /_/\__, /____/
#                        /____/

export XDG_CONFIG_HOME=${HOME}/.config

alias vi='vi -c "let g:tty='\''$(tty)'\''"'
alias v='vi'
alias nv='nvim'
alias i3c="vi ${HOME}/.config/i3/config"
alias bsc="vi ${HOME}/.bashrc"
alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/config"
