" DJ Pelland
" Vim configuration file
" Required {{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"}}}
" Plugins {{{

" --- Filetype ---
        "Javascript
        Plugin 'pangloss/vim-javascript'
        Plugin 'mxw/vim-jsx'

" --- Colorscheme ---
        Plugin 'altercation/vim-colors-solarized'

" --- Functionality ---
        "AutoComplete and Snippets
            Plugin 'Valloric/YouCompleteMe'
            Plugin 'SirVer/ultisnips'
            Plugin 'honza/vim-snippets'
        "Document/Project Navigation
            Plugin 'EasyMotion'
            Plugin 'ctrlp.vim'
            Plugin 'scrooloose/nerdtree'
        "Debugging and Syntax Help
            Plugin 'scrooloose/syntastic'
            Plugin 'joonty/vdebug'
            Plugin 'marijnh/tern_for_vim'
        "Visual Aids
            Plugin 'myusuf3/numbers.vim'
            Plugin 'bling/vim-airline'
        "Coding Assist
            Plugin 'scrooloose/nerdcommenter'
            Plugin 'godlygeek/tabular'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
" Config (no plugins) {{{

"------------------------------
"General
"------------------------------
"map leaders
let mapleader = ","
let maplocalleader = "\\"


"------------------------------
"Color
"------------------------------
"
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_contrast="high"
let g:solarized_visibility="high"

"extra GUI options
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"------------------------------
"Backups, Tmp Files, and Undo
"------------------------------
set backup
"set backupdir=~/.vim/.backup/
"set directory=~/.vim/.tmp/
"Persistent Undo
set undofile
set undodir=~/.vim/.undo/

"------------------------------
"UI
"------------------------------
set ruler
set nowrap
set laststatus=2
set cmdheight=2
set encoding=utf-8
set title
set number

"------------------------------
"Behaviors
"------------------------------
set autoread
set wildmenu
set hidden
set history=1000
set cf
set timeoutlen=350
set nostartofline
set scrolloff=5

"------------------------------
"Text Format
"------------------------------
set autoindent
set tabstop=4
set softtabstop=4
set backspace=2
set shiftwidth=4
set cindent
set smarttab
set expandtab
set wrap

"------------------------------
"Searching
"------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
            \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc

"------------------------------
"Visual
"------------------------------
set showmatch
set matchtime=2

set list

"show trailing space as dots and carrots for extended lines
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\([^=].\+\)\?$'

"------------------------------
"Sounds
"------------------------------
set noerrorbells
set novisualbell
set t_vb=

"------------------------------
"Mouse
"------------------------------
set mousehide
set mouse=a
set complete=.,w,b,u,U




"}}}
" Mappings {{{
"
" NO ARROW KEY
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" EASY SPLIT WINDOW NAV
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Space to toggle folds
nnoremap <space> za
vnoremap <space> za

"repat last macro with Q
nmap Q @@

" Yank from cursor to eol
map Y y$

"easier line completion
imap <C-l> <C-x><C-l>

"use ; for :
nnoremap ; :
vnoremap ; :

"====================
"Leader Commands
"=====================

"Easy Buffer nav
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

"Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
"Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vimrc
"Quickly switch to last buffer
nnoremap <leader>, :e#<CR>
"Close curernt window
nmap <silent> <leader>sc :close<CR>
" window splits
nmap <silent> <leader>vs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>

" clear highlight after search
noremap <silent><leader>/ :nohls<CR>


" Yank content in OS's clipoard. 'o' stand for OS clipboard
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

"format entire file
nmap <leader>fef ggVG=

"}}}
" Plugin Config {{{

"   NERD TREE (auto start)
"autocmd vimenter * NERDTree

"   ULTISNIPS TRIGGER CONFIG
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"   HTML.VIM FILETYPE SETTINGS
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head"

"   HTML AUTOCLOSE
au FileType php,js,jsx so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

"}}}
" Functions {{{
"
"}}}
" Auto Commands {{{

"Volt template engine filetype to php
au BufNewFile,BufRead *.volt set filetype=php

"Set marker folding in vimrc
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"Update vimrc on save
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


"}}}
