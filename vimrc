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
set mouse=a                   " enable mouse in all modes
set laststatus=2              " always show status line
set cursorline                " highlight current line
syntax on

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" map ctrl+s to save current file
noremap <C-s>          :w<CR>
vnoremap <C-s>         <C-c>:w<CR>
inoremap <C-s>         <C-o>:w<CR>

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
