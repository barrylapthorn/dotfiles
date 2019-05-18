#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Anything that sway needs to run needs to be on the path
# before we run sway.
export PATH=$PATH:$HOME/bin

if [ "$XDG_RUNTIME_DIR" == "" ]
then
	export XDG_RUNTIME_DIR=/tmp
fi

export XDG_DESKTOP_DIR="$HOME"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/images"
export XDG_VIDEOS_DIR="$HOME/videos"

#  Add to PATH if not already there
pupdate() { case ":${PATH:=$1}:" in *:$1:*) ;; *) PATH="$PATH:$1" ;; esac; }

# Fix for SwayWM apparently.  https://github.com/swaywm/sway/wiki
export _JAVA_AWT_WM_NONREPARENTING=1

alias h=history
alias ls='ls --color=auto'

#  Pylinter
pupdate $HOME/.local/bin

source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

function colour_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

# https://stackoverflow.com/a/6086978
colour_my_prompt


# This should be last thing in bashrc so that we've set everything that 
# sway might need.

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
