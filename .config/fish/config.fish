set -x TERM xterm-256color

set -gx XDG_CONFIG_HOME $HOME/.config

set -gx PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig
set -gx PATH $PATH /snap/bin /usr/local/go/bin $HOME/bin /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $HOME/.local/bin $HOME/.krew/bin $HOME/.kubectx $HOME/go/bin $HOME/.cargo/bin $HOME/.yarn/bin $HOME/android-studio/bin $HOME/.luarocks/bin $PYENV_ROOT/bin

set -gx WINHOME (wslpath (wslvar USERPROFILE))
set -gx CDPATH . $HOME $HOME/repos $WINHOME $WINHOME/Documents
source $XDG_CONFIG_HOME/fish/private.fish

set -gx EDITOR nvim
set -gx VISUAL ewrap
set -gx ICONLOOKUP 1
set -gx NNN_BMS 'w:$WINHOME'
set -gx NNN_PLUG 'o:fzopen;v:imgview;u:getplugs;f:fzcd;p:preview-tui'
set -gx NNN_COLORS '2134'

# Set the cursor shape for the different vi modes.
set -g fish_cursor_default     block      blink
set -g fish_cursor_insert      line       blink
set -g fish_cursor_replace_one underscore blink
set -g fish_cursor_visual      block

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --hidden --no-ignore --type f'
set -gx FZF_DEFAULT_OPTS '--height 40% --bind 'ctrl-/:toggle-preview' --preview-window wrap --reverse'
set -gx FZF_CTRL_T_OPTS "--preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias vim="nvim"
alias n="nnn -eax"
alias k="kubectl"
alias r="R"
alias jp="jupyter lab --no-browser"

# exa and bat need to be installed
alias ls="exa --long --header --git --group"
alias cat="bat"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/muskuloes/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

starship init fish | source
