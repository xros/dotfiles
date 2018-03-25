# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) # for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# For git branch show in promote
# Git branch in prompt.
#parse_git_branch() {
        #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

# Git branch in prompt with better sign ""
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/( \1)/'
}



# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add alias for github/bitbucket/other gits pushing
# pushing from origin to master without --tags
alias gitpom='git push -uv origin master'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# setting python env
PYTHONSTARTUP=$HOME'/.pythonstartup'
export PYTHONSTARTUP


# [highlight 'username' and 'hostname']
# --All red one
#PS1="\[\033[1;32m\][\[\033[1;31m\]\u@\h:\[\033[1;34m\]\w\[\033[1;32m\]]\[\033[1;31m\]\$\[\033[0m\]"
# --With Tree list one
#PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
## --For regular user format 1
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
## --For regular user format 2
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
## --For regular user format 3 (without hostname)
#PS1='\[\e[1;32m\]\u@\h \W\$\[\e[0m\] '
## --For regular user format 4 (with hostname bold font)
#PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
## --For regular user format 5 (with hostname regular font)
#PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '



# -- For ParrotSecurity Linux Distro promote
# If this is an xterm set the title to user@host:dir                            
#PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\] "  

# New PS1 with git branch support since 20180315
PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\$(parse_git_branch)\$\[\e[0m\] "

export TERM=xterm-256color
# To set two finger scrolling things for IOS things
# This works for Thinkpad X201i
# It is recommended to add the link below to the file '/etc/rc.local'
#xinput set-prop 13 "Synaptics Two-Finger Scrolling" 1 1

alias rm='rm -i'
genpasswd() {
        local l=$1
        [ "$l" == "" ] && l=20
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${1} | xargs
}


###################
# For UAV hacking #
###################
if [ -d "/usr/local/src/ardupilot" ] ; then
    export PATH=$PATH:/usr/local/src/ardupilot/Tools/autotest
else
    true
fi

# JSBSim (Plane only)
if [ -d "/usr/local/src/jsbsim" ] ; then
    export PATH=$PATH:/usr/local/src/jsbsim/src
else
    true
fi

if [ -d "/usr/lib/ccache" ] ; then
    export PATH=/usr/lib/ccache:$PATH
    export CCACHE_DIR=/var/tmp
else
    true
fi

#########################################
# Set $GOPATH for Go-Lanugage projects  #
#########################################
if [ -d "$HOME/goworks" ] ; then
    export GOPATH=$HOME/goworks
else
    true
fi

#######################################################################
# Set binary path for Go-Lanugage                                     #
# In this case, the golang-go will not work if installed from apt-get #
#######################################################################
if [ -d "/usr/local/go" ] ; then
    export PATH=$PATH:/usr/local/go/bin
else
    true
fi

#######################################################################
# Set anaconda Python3 path for machine learning  ( No Python2 )      #
# we need to set it in front of the path to make it work              #
# [!] Important, if you don't do statistics, comment this section!    # 
#     or your previous projects may not function, due to packages     #
#     missing or version wrong.                                       #
#######################################################################
if [ -d "/usr/local/anaconda3" ] ; then
    export PATH=/usr/local/anaconda3/bin:$PATH
else
    true
fi

#######################################################################
# Set JAVA JDK 8 path if installed                                    #
# Comment these lines if you want to use openjdk                      #
#######################################################################
if [ -d "/opt/jdk1.8.0_45" ] ; then
    export JAVA_HOME=/opt/jdk1.8.0_45/
    export JRE_HOME=/opt/jdk1.8.0._45/jre 	
    export PATH=$PATH:/opt/jdk1.8.0_45/bin:/opt/jdk1.8.0_45/jre/bin
else
    true
fi

#########################################
# Unset TMUX var for new session        #
#########################################
unset TMUX



#######################################################################
# Set CUDA 8.0 Lib path if installed                                  #
# Cuda 8.0 works with Tensorflow 1.4 for machine learning             #
#######################################################################
if [ -d "/usr/local/cuda-8.0" ] ; then
    export PATH="/usr/local/cuda-8.0/bin":$PATH
    export LD_LIBRARY_PATH="/usr/local/cuda-8.0/lib64":$LD_LIBRARY_PATH
else
    true
fi

