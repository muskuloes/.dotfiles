let mapleader="\<space>"
let maplocalleader ="\<space>"

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
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
Plug 'mhinz/vim-startify'
" Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'voldikss/vim-floaterm'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'fannheyward/telescope-coc.nvim'
call plug#end()

lua require("muskuloes")

filetype plugin on
set background=dark
set clipboard+=unnamedplus
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set splitbelow
set splitright
set nohls
set encoding=UTF-8
set wrap
set backspace=indent,eol,start
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list
set updatetime=1000
set mouse=a
set completeopt=menu,menuone,preview,noselect,noinsert
set cursorline
set cursorcolumn
set termguicolors

colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
highlight TelescopeSelection      guifg=#D79921 gui=bold " Selected item
highlight TelescopeNormal         guibg=#00000           " Floating windows created by telescope

" Border highlight groups
highlight TelescopeBorder         guifg=#ffffff
highlight TelescopePromptBorder   guifg=#ffffff
highlight TelescopeResultsBorder  guifg=#ffffff
highlight TelescopePreviewBorder  guifg=#ffffff

" Highlight characters your input matches
highlight TelescopeMatching       guifg=#90ee90

autocmd! FileType TelescopeResults setlocal nofoldenable

let g:airline_theme='wombat'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  if has("nvim")
    autocmd BufEnter,FocusGained,TermOpen,TermEnter,TermLeave term://* setlocal nonumber norelativenumber
  endif
augroup END

" Nerd commenter
let g:NERDSpaceDelims = 1

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
nnoremap <silent><c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <silent><c-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent><c-n> <cmd>lua require('telescope.builtin').file_browser({depth=3})<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>ec <cmd>lua require('telescope.builtin').file_browser({cwd="$DOTFILES"})<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" map <c-leftmouse> <nop>

" coc
let g:coc_global_extensions = ['coc-json', 'coc-yaml', 'coc-tsserver', 'coc-sh',  'coc-go', 'coc-vetur', 'coc-rust-analyzer', 'coc-pyright', 'coc-markdownlint', 'coc-elixir', 'coc-css', 'coc-prettier', 'coc-emmet']
let g:coc_filetype_map = {
  \ 'htmldjango': 'html',
  \ }
autocmd FileType python let b:coc_root_patterns = ['Pipfile']
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
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufWritePre *.py :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" Nvim-R settings
let R_assign     = 2
let R_notmuxconf = 1
let R_in_buffer  = 0
let R_source     = $HOME . '/.vim/plugged/Nvim-R/R/tmux_split.vim'
let R_tmux_title = 'automatic'
let R_close_term = 1
let R_hl_term    = 1
let R_pdfviewer  = 'evince'

" Rust
let g:rustfmt_autosave = 1

" Floaterm
let g:floaterm_keymap_new    = '<f5>'
let g:floaterm_keymap_prev   = '<f6>'
let g:floaterm_keymap_next   = '<f7>'
let g:floaterm_keymap_toggle = '<f12>'
let g:floaterm_width         = 0.8
let g:floaterm_height        = 0.8


" vim-visual-multi
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<c-d>'
let g:VM_maps['Find Subword Under'] = '<c-d>'

nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)
nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)
