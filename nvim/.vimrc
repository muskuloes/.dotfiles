let mapleader="\<space>"
let maplocalleader ="\<space>"


call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'liuchengxu/nerdtree-dash'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'xolox/vim-misc'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'ryanoasis/vim-devicons'
Plug 'neomake/neomake'
Plug 'chrisbra/csv.vim'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/webapi-vim'
Plug 'airblade/vim-rooter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'edkolev/tmuxline.vim' generated status line
Plug 'jalvesaq/Nvim-R'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Vim 8 only
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'dkarter/bullets.vim'
Plug 'andymass/vim-matchup'
Plug 'Yggdroot/indentLine'
" for tsx syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

filetype plugin on

set background=dark
set clipboard+=unnamedplus
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set splitbelow
set splitright
set nohls
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
set backspace=indent,eol,start
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
set updatetime=1000
set mouse=a
set completeopt=menu,menuone,preview,noselect,noinsert
set cursorline
set cursorcolumn

let g:airline_theme='base16'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  autocmd BufEnter,FocusGained NERD_* setlocal nonumber norelativenumber
  autocmd BufEnter,FocusGained,TermOpen,TermEnter,TermLeave term://* setlocal nonumber norelativenumber
augroup END

" Nerd commenter
let g:NERDSpaceDelims = 1

" Nerd tree
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeGitStatusWithFlags = 1
set encoding=UTF-8
map <silent><c-n> :NERDTreeToggle<CR>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>
nnoremap <leader>w <c-w>_
nnoremap <leader>h <c-w>\|
nnoremap <leader>z <c-w>=
nnoremap th :tabfirst<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap tl :tablast<cr>
nnoremap td :tabclose<cr>
nnoremap <silent><f9> :w<cr>:source %<cr>
nnoremap <silent><expr><c-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"
nnoremap <silent><c-f> :<C-u>RG<cr>
map <c-leftmouse> <nop>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <silent><expr><tab>
  \ pumvisible() ? "\<c-n>" :
  \ <SID>check_back_space() ? "\<tab>" :
  \ coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><space>p  :<C-u>CocListResume<CR>

let g:rustfmt_autosave = 1
let g:coc_filetype_map = {
  \ 'htmldjango': 'html',
  \ }
let g:fzf_preview_window = ['down:60%:hidden', 'ctrl-/']
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS = '--preview-window wrap --reverse'
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec, 'down:hidden', 'ctrl-/'), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Nvim-R settings
let R_assign = 2
let R_notmuxconf = 1
let R_in_buffer = 0
let R_source = $HOME . '/.vim/plugged/Nvim-R/R/tmux_split.vim'
let R_tmux_title = 'automatic'
let R_close_term = 1
let R_hl_term = 1
let R_pdfviewer = 'evince'
