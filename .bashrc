#
# ~/.bashrc
#
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(thefuck --alias fuck)"

export COLORTERM=truecolor

##-----------------------------------------------------
## synth-shell-prompt.sh
# if [ -f /home/nuke/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
# 	source /home/nuke/.config/synth-shell/synth-shell-prompt.sh
# fi

eval "$(zoxide init bash)"
alias cheat="~/bin/cheat.sh"
alias weather="~/bin/wttr.sh"
source ~/.local/share/blesh/ble.sh
