set -x TERM xterm-256color
set -x CDPATH . $HOME $HOME/Desktop


set -gx PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PATH /snap/bin /usr/local/go/bin $HOME/bin /home/linuxbrew/.linuxbrew/bin $HOME/.local/bin $HOME/.krew/bin $HOME/.kubectx $HOME/go/bin $HOME/.cargo/bin $HOME/.yarn/bin $HOME/.luarocks/bin $PYENV_ROOT/bin
set -gx DOTFILES $HOME/Desktop/dev/dotfiles
set -gx EDITOR vim
set -gx VISUAL ewrap
set -gx NNN_BMS 'u:$HOME/Desktop/uni;w:$HOME/Desktop/work'
set -gx NNN_PLUG 'o:fzopen;v:imgview;u:getplugs;f:fzcd'
set -gx NNN_COLORS '2134'

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --hidden --no-ignore --type f'
set -gx FZF_DEFAULT_OPTS '--height 40% --bind 'ctrl-/:toggle-preview' --preview-window wrap --reverse'
set -gx FZF_CTRL_T_OPTS "--preview 'bat --style=numbers --color=always --line-range :500 {}'"

alias vim="nvim"
alias n="nnn -ex"
alias k="kubectl"
alias r="R"

# exa and bat need to be installed
alias ls="exa --long --header --git --group"
alias cat="bat"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

set -gx LUA_PATH '/home/linuxbrew/.linuxbrew/Cellar/luarocks/3.7.0/share/lua/5.4/?.lua;/home/linuxbrew/.linuxbrew/share/lua/5.4/?.lua;/home/linuxbrew/.linuxbrew/share/lua/5.4/?/init.lua;/home/linuxbrew/.linuxbrew/lib/lua/5.4/?.lua;/home/linuxbrew/.linuxbrew/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/muskuloes/.luarocks/share/lua/5.4/?.lua;/home/muskuloes/.luarocks/share/lua/5.4/?/init.lua'

set -gx LUA_CPATH '/home/linuxbrew/.linuxbrew/lib/lua/5.4/?.so;/home/linuxbrew/.linuxbrew/lib/lua/5.4/loadall.so;./?.so;/home/muskuloes/.luarocks/lib/lua/5.4/?.so'
