#                                        __
#      ____  _________  ____ ___  ____  / /_
#     / __ \/ ___/ __ \/ __ `__ \/ __ \/ __/
#  _ / /_/ / /  / /_/ / / / / / / /_/ / /_
# (_) .___/_/   \____/_/ /_/ /_/ .___/\__/
#  /_/                        /_/

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
