#for wayland for gtk & qt
#export GDK_BACKEND=wayland
#export QT_QPA_PLATFORM=wayland-egl

#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt HIST_IGNORE_SPACE
HISTORY_IGNORE="*md5sum*"

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
autoload -Uz promptinit
promptinit
prompt adam2

export PATH=$PATH:~/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/develop/skat

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

alias tt='timetrace'

alias bc='bc -ql'
alias wget='wget -N'
alias dot_all='dot -Tpng -O *.dot'
alias ftml_all='for file in *.ftml; do ftml $file > "${file%.ftml}.txt"; done'

alias cal='cal -m'

alias grip='grep -nRI'

alias lock="swaylock -c 000000"

# rlwrap for arrow work
alias sbcl='rlwrap sbcl'
alias maxima='rlwrap maxima'

# java wayland
alias scilab='_JAVA_AWT_WM_NONREPARENTING=1 scilab'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

my-backward-delete-word () {
	local WORDCHARS=${WORDCHARS/\//}
	zle backward-delete-word
}

zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

#for HEAD^ work
#unsetopt extendedglob
setopt NO_NOMATCH

alias cformat="clang-format --dry-run"

alias beep='play -qn synth 5 pluck A5 vol -20dB 2> /dev/null'

alias alert='notify-send "$(pwd):$?" "success" || notify-send "$(pwd):$?" "failure" && beep'

export PDFLATEX_ERROR_OPTS="-interation nonstopmode"

