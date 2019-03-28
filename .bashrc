#
# ~/.bashrc
#

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Fix for SwayWM apparently.  https://github.com/swaywm/sway/wiki
export _JAVA_AWT_WM_NONREPARENTING=1

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias h=history

# See https://news.ycombinator.com/item?id=11071754
#
# git init --bare $HOME/.mydotfiles.git
# config config status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'

