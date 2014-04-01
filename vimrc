" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set nu
set showcmd                   " show command status
set showmatch                 " flashes matching paren when one is typed
set showmode                  " show editing mode in status (-- INSERT --)
set ruler                     " show cursor position
set history=1000
set visualbell                " no sounds
set autoread                  " reload files changed outside vim
set hlsearch                  " highlight searches
set ignorecase                " ignore case of searches
set incsearch                 " hightlight dynamically as pattern is typed
set title                     " show the file name in window titlebar
set laststatus=2              " always show status line
set cursorline                " highlight current line
set ttimeoutlen=100           " make ESC key faster

set mouse=a                   " enable mouse in all modes
if exists('$TMUX')            " Support resizing in tmux
  set ttymouse=xterm2
endif

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" map ctrl+j/k to go to next/prev split
noremap  <C-j>          <C-w>w
noremap  <C-k>          <C-w>W
inoremap <C-j>          <C-o><C-w>w
inoremap <C-k>          <C-o><C-w>W

" map ctrl+s to save current file and return to command mode
nnoremap  <C-s>         :w<CR>
vnoremap  <C-s>         <C-c>:w<CR>
inoremap  <C-s>         <C-c>:w<CR>

" map ctrl+s,s to save and exit in command mode
nnoremap  <C-s><C-s>    :wq<CR>

" map ctrl+q,q to quit without save in command and insert mode
nnoremap  <C-q><C-q>    <C-c>:q!<CR>
inoremap  <C-q><C-q>    <C-c>:q!<CR>

" map F2 to save if necessary, does not change mode
nnoremap  <F2>          :update<CR>
vnoremap  <F2>          <ESC>:update<CR>gv
inoremap  <F2>          <C-o>:update<CR>

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" handle ctrl+arrow, shift+arrow correctly in tmux"
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" set for golang
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
