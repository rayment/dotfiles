#               _
#     ____ ___ | |__   _ __  ___
#    |_  // __|| '_ \ | '__|/ __|
#  _  / / \__ \| | | || |  | (__
# (_)/___||___/|_| |_||_|   \___|
#

# load default environment profile settings
if [ -e /etc/profile ]; then
	. /etc/profile
fi

# test for an interactive shell and quit if not
if [[ $- != *i* ]] ; then
	return
fi

if [ ! -z "$TMUX" ];
then
	# close tmux session on st close
	tmux set-option destroy-unattached
fi

# umask protection
umask 027

# XDG spec
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# user variables
export BROWSER=firefox
export DOWNLOADS="$HOME/Temp"
export EDITOR=vim
export CSCOPE_EDITOR=vim
export MANPAGER=manpager

# hist file
HISTSIZE=512
HISTFILESIZE=1024
export HISTFILE=$XDG_CACHE_HOME/zsh/zsh_history

# timeout
TMOUT=300
readonly TMOUT
export TMOUT

# include protected vars
if [ -e "$HOME/.config/zsh/zshprotect" ];
then
	source "$HOME/.config/zsh/zshprotect"
fi

# initialisation variables
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java" \
                     _JAVA_AWT_WM_NONREPARENTING=1
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export LESSHISTFILE=-
export MAIL="$HOME/Mail"
export PYTHONSTARTUP="/usr/share/python/python_startup.py"
export STARDICT_DATA_DIR="/usr/share"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export WINEPREFIX="$XDG_DATA_HOME/wine"
#if [ "$(whoami)" = "root" ];
#then
#	unset XAUTHORITY
#else
export XAUTHORITY="$HOME/.config/x/xauthority"
#fi

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
	'%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
	'%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ];
	then
		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}

# system variables
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/.scripts:$HOME/.scripts/shortcuts:$HOME/.local/bin:$PATH"
export PATH="$PATH:/sbin"
if [ "$(whoami)" = "root" ];
then
	export PROMPT="%B%F{red}%n%F{green}@%M:%F{cyan}%1~%B%F{green}%b%f\$ "
else
	export PROMPT="%B%F{cyan}%n%F{green}@%M:%F{red}%1~%B%F{green}%b%f\$ "
fi
export RPROMPT=$'$(vcs_info_wrapper)'

# command aliases
alias bt="bluetoothctl"               # bluetooth manaager shortcut
alias diff="diff --color=always"      # coloured diff
alias feh="feh --scale-down"          # dimension-corrected feh
alias firejail="LC_ALL=C TERM=xterm-color firejail"
                                      # environment-fixed firejail
alias grep="grep --color=auto"        # coloured grep
alias less="less -R"                  # escaped less
alias fwupd="fwupdtool"               # firmware updater
alias irc="weechat"                   # iirc alias
alias iirc="weechat"                  # iirc alias
alias ls="ls --color=auto -G"         # ungrouped ls
alias la="ls -hlFH"                   # technical ls, no hidden files
alias ll="ls -ahlFH"                  # technical ls
alias lynx="lynx -display_charset=utf8 -nopause -cfg=$XDG_CONFIG_HOME/lynx/lynxrc"
                                      # lynx with config
alias mutt="neomutt"                  # shortened version of neomutt
alias neofetch="screenfetch"          # screenfetch redirect
alias python="python3 -B"             # disable __pycache__
alias python3="python3 -B"            # disable __pycache__
alias rclear="clear && read"          # clear and wait for input
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
                                      # tmux with config
alias vi="vim"                        # vi redirect
alias watch="watch --color"           # coloured watch

# custom commands
alias cfg="git --git-dir=$HOME/.dot --work-tree=$HOME"
                                      # dotfile git alias
alias clean="make clean"              # when I forget to type make
alias open="xdg-open 2>/dev/null"     # open files by mime-type
alias procs="ps haux Ou | cut '-d ' -f1 | uniq -c"
                                      # num. of running procs.
alias search="grep -irnw . -e"        # search for keyword in files recursively
alias shutdown="shutdown -h now"      # easy shutdown
alias wget="wget --hsts-file $XDG_CACHE_HOME/wget/hsts"
                                      # hide away the wget hosts file

# autocompletions
autoload -U compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

# completion style
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches found for: %d%b'
zstyle ':completion:complete:*' use-cache 1

# auto corrections
setopt correctall

