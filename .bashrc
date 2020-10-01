#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '





export LESSHISTFILE=/dev/null                        # disable less history. This has lower priority compared to ~/.lesskey file
#set -o noclobber                                     # Prevent overwriting file with output redirection. Can be forced with ">|"
shopt -s autocd                                      # Auto cd if entered path
shopt -s histappend                                  # Unlimited history, append a session's history on shell exit
export NO_AT_BRIDGE=1                                # Do not start at-spi2-registryd services
export HISTCONTROL=erasedups                         # Do not save duplicates in history
export IGNOREEOF=2                                   # Ctrl + D exit shell after hitting 100 times (default 10 times)
export HISTSIZE=                                     # Unlimited lines in history file
export HISTFILESIZE=                                 # Unlimited history file size
export HISTTIMEFORMAT="[%F %T] "                     # Include date when command was ran in history
#export HISTFILE=~/.other                            # Change file location. Certain bash sessions truncate .bash_history file upon close.
RED="\[\033[1;31m\]"                                 # Red color
BLUE="\[\033[1;34m\]"                                # Blue color
GREEN="\[\033[1;32m\]"                               # Green color
YELLOW="\[\033[1;33m\]"                              # Yellow color
LIGHT_BLUE="\[\033[1;36m\]"                          # Light blue color
OFF="\[\033[0m\]"                                    # Turn off previous colors
LOGO=$'\[\e[37m\]\xef\x85\xbc'                       # Linux penguin logo LOGO=''                             
COM="\$([ \$? -ne 0 ] && echo \[\e[41m\])"           # Previous command output, if error make prompt red
GIT=$'$(__git_ps1 " (%s)")'                       # Git function PS1
source /usr/share/git/completion/git-prompt.sh    # Needed for git status prompt to work
export GIT_PS1_SHOWDIRTYSTATE=1                   # + for staged, * if unstaged
export GIT_PS1_SHOWCOLORHINTS=1                   # $ if something is stashed
export GIT_PS1_SHOWUNTRACKEDFILES=1               # % if there are untracked files
export GIT_PS1_SHOWUPSTREAM=1                     # <,>,<> behind, ahead, or diverged from upstream
PS1="${COM}${LOGO} ${GIT}${USER}@\h\[$(tput sgr0)\] ${GREEN}\w${OFF} "    # PS1 prompt



#export variables
export JAVA_HOME=/usr/lib/jvm/java-13-openjdk
#export MOZ_X11_EGL=1



#my aliases
alias films='~/tools/adjaranet/main.py'
alias env="source /home/davit/Documents/env/bin/activate"
alias ge="trans :ka"
alias en=trans
alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias download="youtube-dl -x -i --audio-format opus --yes-playlist --playlist-start $1 $2"
alias grubconfig='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ..='cd ..'                                                              # move to parent directory
alias e='exit'
alias b='sudo systemctl start bluetooth && bluetoothctl power on && bluetoothctl scan on'                                                             # exit with e
alias cp='cp -i'                                                              # cp in interactive mode. Worns before overwriting file
alias mv='mv -i'                                                              # mv in interactive mode. Worns before overwriting file
alias rm='rm -i'                                                              # rm in interactive mode. Worns before overwriting file
alias grep='grep --color=auto'                                                # grep with colors
alias ls='ls --color=auto --group-directories-first'                          # Tweaked prompt with color support and directories first
alias ll='ls -l --color=auto'                                                 # list all with permission and size info
alias l.='ls -d .* --color=auto'                                              # list all including hidden files
alias ll.='ls -la --color=auto'
alias packages='pacman -Qq | fzf --preview "pacman -Qil {}" \
              --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"' # show all packages
alias packages_by_source="pacman -Sl | awk -v n=\$(pacman -Qm | wc -l) \
                         ' /\[installed\]/ {repos[\$1] += 1; total += 1} \
                         END {for (repo in repos) {print repo, repos[repo] } \
                         print \"AUR/Other\", n; print \"Total\", \
                      n+total}' | column --table -N REPOSITORY,PACKAGES"


alias lf='du -sh * | sort -h'                                                 # sort files and folders by sizes
alias ld='du -sch .[!.]* * |sort -h'
alias glob_ip='curl ipecho.net/plain&&echo'
alias clean='sudo pacman -Sc'

alias services='systemctl --type=service'

alias "startphp"="sudo systemctl start php-fpm.service;sudo systemctl start mysqld.service;" # for learning purspses
alias "stopphp"="sudo systemctl stop php-fpm.service;sudo systemctl stop mysqld.service;"
alias "save"="xclip -selection c -o >> $1"





