# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ============================================================================ #
# ============================== Beshoy Settings ============================= #
# ============================================================================ # 

# ==================
# ----- Aliases ----
# ================== 
alias desktop='cd ~/Desktop'
alias programs='cd ~/Beshoy/Programs'
alias vdt_repo='cd ~/Beshoy/Git/ai.aai.vdt' 
alias conti_repo='cd ~/Beshoy/Git/aai.continental'
alias aailibrary='cd ~/Beshoy/Git/Temp/TestRepoCheckout/ai.aai.library'
alias repos='cd ~/Beshoy/Git' 
alias pycharm='~/Beshoy/Programs/pycharm-2018.2.2/bin/pycharm.sh'
alias sharedfolder='cd /media/sf_VirtualBoxShareFolder/'
alias clion='~/Beshoy/Programs/clion-2018.2.2/bin/clion.sh'
alias preparebuild='cd ../; rm -rf Build; mkdir Build; cd Build' 
alias scripts='cd ~/Beshoy/Scripts' 
alias beshoy='cd ~/Beshoy'
alias downloads='cd ~/Downloads'
alias generategitpull='ln -s /home/byehia1/Beshoy/Scripts/Git/pull_git_latest.py $1'
alias generatecleanup='ln -s /home/byehia1/Beshoy/Scripts/Server/simulation_server_cleanup.py $1'
alias lint='cpplint --filter=-build/c++11 --linelength=160 $(git status --porcelain|sed s/^...//)' 
alias license_cpp_unittest='ctest -V -C Release -R License'
alias fmu_check='/home/byehia1/Downloads/FMUChecker-2.0.4-linux64/fmuCheck.linux64' 
alias copy_cd='pwd | xclip -selection clipboard'
alias sgit_commit_msg_change='python ~/Beshoy/Scripts/Git/git_commit_msg_change.py'
alias git_alias='git config --get-regexp alias'
alias log_cmake_build_cmd='echo \"cmake -DCMAKE_INSTALL_PREFIX=${PWD}/Install  -DAAI_PYTHON_DIR=/home/byehia1/anaconda3/envs/VDT   -DBUILD_TESTS=True -DBUILD_EXAMPLES=True -DAAI_COTIRE_ENABLED=ON ..\"'
alias run_cmake_cmd='cmake -DCMAKE_INSTALL_PREFIX=${PWD}/Install  -DAAI_PYTHON_DIR=/home/byehia1/anaconda3/envs/VDT   -DBUILD_TESTS=True -DBUILD_EXAMPLES=True -DAAI_COTIRE_ENABLED=ON ..' 
alias log_make_cmd='echo \"make -j 8 install\"'
alias make_cmd='make -j 8 install' 
alias shared='cd /media/sf_VirtualBoxShareFolder' 
alias carmaker='/opt/ipg/bin/CM-8.0' 

# ============================
# ---- PATH Modifications ----
# ============================ 
export PATH="~/Beshoy/Programs/pycharm-2018.2.2/bin:$PATH"

# ================================
# ---- Enviromental Variables ----
# ================================ 
# Adding library pathes needed to run the dummy simulator 
# Library --> don't remember 
# export LD_LIBRARY_PATH=/home/byehia1/Beshoy/Git/Temp/TestRepoCheckout/ai.aai.vdt/development/automotive_ai/aai_library/cpp/linux-amd64/lib:$LD_LIBRARY_PATH
# Library --> libboost_python35.so.1.68.0
# export LD_LIBRARY_PATH=/home/byehia1/Beshoy/Git/Temp/TestRepoCheckout/ai.aai.vdt/development/automotive_ai/aai_library/python/linux-amd64:$LD_LIBRARY_PATH 

# =================
# ---- Methods ---- 
# =================
# Modify the title of the terminal 
setTitle(){ 
  ORIG=$PS1
  TITLE="\e]2;$@\a"
  PS1=${ORIG}${TITLE}
}

# Colorize the output of find command 
coloredfind(){
  find . -name $1 | grcat ~/Beshoy/settings/grcSettings
}



# ==================
# ---- Programs ---- 
# ==================
# Powerline style shell prompt setup 
# function _update_ps1() {
#   PS1=$(powerline-shell $?)
# }
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi


# added by Anaconda3 installer
export PATH="/home/byehia1/anaconda3/bin:$PATH"

# Debugging Command 
# echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope 

# ===========================
# ---- Terminal Settings ----
# ==========================
# Set the column length, to solve terminal issue when line length exceeds the line terminal doesn't go to a new line instead override same line
COLUMNS=250 
