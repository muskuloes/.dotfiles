set -x TERM xterm-256color
set -x CDPATH . ~ ~/Desktop

set -gx PATH /snap/bin /usr/local/go/bin $HOME/bin /home/linuxbrew/.linuxbrew/bin $HOME/.local/bin $HOME/.krew/bin $HOME/.kubectx $HOME/.fzf/bin $HOME/go/bin $HOME/.yarn/bin $PATH
set -gx EDITOR vim
set -gx VISUAL ewrap
set -gx NNN_BMS 'u:~/Desktop/uni;w:~/Desktop/work'
set -gx NNN_PLUG 'o:fzopen;v:imgview;u:getplugs'

alias vim="nvim"
alias n="nnn -e"
alias k="kubectl"
alias r="R"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/muskuloes/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

