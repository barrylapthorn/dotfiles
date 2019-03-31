#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Anything that sway needs to run needs to be on the path
# before we run sway.
export PATH=$PATH:/home/barry/bin

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

PS1='[\u@\h \W]\$ '

# See https://news.ycombinator.com/item?id=11071754
#
# git init --bare $HOME/.mydotfiles.git
# config config status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/.mydotfiles.git/ --work-tree=$HOME'

#  Pylinter
pupdate /home/barry/.local/bin


# This should  be last thing in bashrc so that we've set everything that 
# sway might need.

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
