#for wayland for gtk & qt
#export GDK_BACKEND=wayland
#export QT_QPA_PLATFORM=wayland-egl

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/karzhaev/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=$PATH:~/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/develop/skat

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

alias bc='bc -ql'
alias wget='wget -N'
alias dot_all='dot -Tpng -O *.dot'

#alias for screen
alias scr='screen -R'
alias scrl='screen -ls'

alias lock="i3lock -c 000000"
alias :q="exit"
