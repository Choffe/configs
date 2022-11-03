# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Axis proxy

# Use before any command that need to push a hole through the proxy
alias proxy="\
auto_proxy=http://wwwproxy.se.axis.com/auto \
AUTO_PROXY=$auto_proxy \
http_proxy=http://wwwproxy.se.axis.com:3128 \
HTTP_PROXY=$http_proxy \
https_proxy=$http_proxy \
HTTPS_PROXY=$https_proxy \
no_proxy=localhost,127.0.0.0/8,.se.axis.com,10.0.0.0/8,172.16.0.0/12,172.30.8.0/22,192.168.0.0/16 \
NO_PROXY=$no_proxy \
ftp_proxy=http://ftpproxy.se.axis.com:4514/ \
FTP_PROXY=$ftp_proxy
"

# Exports all proxy variables for current shell
function set_proxy {
export auto_proxy=http://wwwproxy.se.axis.com/auto
export AUTO_PROXY=$auto_proxy
export http_proxy=http://wwwproxy.se.axis.com:3128
export HTTP_PROXY=$http_proxy
export https_proxy=$http_proxy
export HTTPS_PROXY=$https_proxy
export no_proxy=localhost,127.0.0.0/8,.se.axis.com,10.0.0.0/8,172.16.0.0/12,172.30.8.0/22,192.168.0.0/16
export NO_PROXY=$no_proxy
export ftp_proxy=http://ftpproxy.se.axis.com:4514/
export FTP_PROXY=$ftp_proxy
}

# Unsets all proxy variables for current shell
function unset_proxy {
    unset auto_proxy
    unset AUTO_PROXY
    unset HTTP_PROXY
    unset http_proxy
    unset FTP_PROXY
    unset no_proxy
    unset HTTPS_PROXY
    unset https_proxy
    unset NO_PROXY
    unset ftp_proxy
}

set_proxy

# Path to your oh-my-zsh installation.
export ZSH="/home/kristofj/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ ! -e /usr/share/oe-setup/lazy-load.sh ] || . /usr/share/oe-setup/lazy-load.sh

# Use an axis camera as webcam for ig. teams meetings
sudo modprobe v4l2loopback
alias axis-webcam="gst-launch-1.0 rtspsrc location='rtsp://root:pass@192.168.0.90/axis-media/media.amp?videocodec=jpeg&resolution=1280x720' latency=100 ! decodebin ! videoconvert ! "video/x-raw,format=YUY2" ! v4l2sink device=/dev/video0"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

unsetopt share_history

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LESSCHARSET=""

coffee() {
  seconds=480
	start="$(($(date +%s) + $seconds))"
	while [ "$start" -ge `date +%s` ]; do
		time="$(( $start - `date +%s` ))"
		printf 'brewing... done in: %s\r' "$(date -u -d "@$time" +%H:%M:%S)"
	done
  ps -ef | grep " pts/" | awk '{print $6}' | sort -u  | while read TTY; do echo "Coffe is done! Go get some!!" | sudo tee /dev/$TTY 1>/dev/null; done
}
