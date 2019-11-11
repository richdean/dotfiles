set nocompatible
filetype plugin indent on

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

 " Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Nerd tree
Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Utils
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-smooth-scroll'
Plug 'jiangmiao/auto-pairs'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'

" Rust
Plug 'rust-lang/rust.vim'

" Reason
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" OCaml
" TODO
" https://dev.realworldocaml.org/install.html
" https://github.com/ocaml/merlin/wiki/vim-from-scratch

" Haskell
" TODO
" http://marco-lopes.com/articles/Vim-and-Haskell-in-2019/

" Linting
Plug 'w0rp/ale'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code completion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()

syntax on
set encoding=utf-8
set clipboard=unnamed,unnamedplus

if exists('+termguicolors')
  " set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
set background=dark
colorscheme iceberg

let g:airline_theme='iceberg'
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Reduce update time for git gutter
set updatetime=100

" Remap esc
inoremap jk <esc>

" Leader
let mapleader = " "

" Turn on relative line numbers
set number relativenumber

set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set cursorline
set linespace=6 " Set line height
set backspace=2
set ignorecase

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" No arrow keys!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Splits
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
nnoremap <silent> <leader>- :split<CR>
nnoremap <silent> <leader>\ :vsplit<CR>
nnoremap <silent> <leader>0 :only<CR>

" Maximize split
" Use '<C-w>=' to make window sizes equal back
nnoremap <C-w><Bslash> <C-w>_<C-w>\|

" Using vim-tmux-navigator for these now
" Quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR><C-w>=
let NERDTreeShowHidden=1

" Linting
let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow'],
  \ 'rust': ['rls'],
  \ }
" let g:ale_reason_ls_executable = '~/.vim/reason-language-server'
" let g:ale_reasonml_refmt_options = ''

" JavaScript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Prettier
" when running at every change you may want to disable quickfix
" let g:prettier#quickfix_enabled = 0
" let g:prettier#autoformat = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Rust
let g:rustfmt_autosave = 1

" Reason
let g:LanguageClient_serverCommands = {
  \ 'reason': ['~/.vim/reason-language-server'],
  \ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient#textDocument_hover()<cr>

" FZF
map <C-p> :FZF<CR>
" General file search
nnoremap <leader>p :FZF<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>ch :History:<cr>
nnoremap <leader>m :Marks<cr>
" Infile search
nnoremap <leader>/ :Lines<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>b :Buffers<cr>
" Git searching
nnoremap <leader>g :GFiles?<cr>
nnoremap <leader>c :Commits<cr>
nnoremap <leader>bc :BCommits<cr>
" Project wide search
nnoremap <leader>? :Ag<cr>
" Colours
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Stip whitespace on save
autocmd BufEnter * EnableStripWhitespaceOnSave
highlight ExtraWhitespace guibg=#ad7c0b

" Smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Code completion
let g:deoplete#enable_at_startup = 1
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Always use vertical diffs
set diffopt+=vertical

" Resize splits automatically
autocmd VimResized * execute "normal! \<c-w>="
