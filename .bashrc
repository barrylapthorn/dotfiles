#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Added https://github.com/ohmybash/oh-my-bash
export OSH=/home/barry/.oh-my-bash

OSH_THEME="font"

# OSH completions.
completions=(
  git
  composer
  ssh
)

# OSH aliases
# aliases=(
#   general
# )

# OSH plugins
plugins=(
  git
  bashmarks
)

DISABLE_UPDATE_PROMPT=true
source $OSH/oh-my-bash.sh

#  End of oh-my-bash stuff


export SSH_KEY_PATH="~/.ssh/rsa_id"

#  Add to PATH if not already there
pupdate() { case ":${PATH:=$1}:" in *:$1:*) ;; *) PATH="$PATH:$1" ;; esac; }

# Fix for SwayWM apparently.  https://github.com/swaywm/sway/wiki
export _JAVA_AWT_WM_NONREPARENTING=1

alias h=history
alias ls='ls --color=auto'

#  Pylinter
pupdate $HOME/.local/bin

# Anything that sway needs to run needs to be on the path
# before we run sway.
export PATH=$PATH:$HOME/bin

if [ "$XDG_RUNTIME_DIR" == "" ]
then
	export XDG_RUNTIME_DIR=/tmp
fi

export XDG_DESKTOP_DIR="$HOME"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/videos"

export LOCAL_BASHRC=.$(hostname).bashrc

if [ -f $LOCAL_BASHRC ]; then
	source $LOCAL_BASHRC
fi

# This should be last thing in bashrc so that we've set everything that 
# sway might need.

# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi
