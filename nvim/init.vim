" ==== INSTALL PLUGINS ====
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
if exists('g:vscode')
  " VSCode extension
  Plug 'asvetliakov/vim-easymotion'
else
  " ordinary neovim
  Plug 'easymotion/vim-easymotion'
endif
Plug 'junegunn/fzf'
Plug 'jremmen/vim-ripgrep'

" Initialize plugin system
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

set noswapfile          " we don't need swapfile
set nobackup            " real man does not need it
set nowrap              " no wrap line
set scrolloff=8         " keep 8 lines when scrolling
set hidden              " Hide files in the background instead of closing them.
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

set updatetime=50       " improve user experience

set undodir=~/.config/nvim/undodir
set undofile

set exrc                " Enable per-directory .vimrc files and disable unsafe commands in them
set secure

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set ruler               " show the current row and column

set autoread            " reload files changed outside vim
set title               " show the file name in window titlebar
set laststatus=2        " always show status line
set cursorline          " highlight current line
set ttimeoutlen=50      " make ESC key faster

set mouse=a             " enable mouse in all modes

autocmd InsertEnter * :set nocul
autocmd InsertLeave * :set cul

set termguicolors       " otherwise a lot of things would not work
set nu                  " show line number
set relativenumber      " show relative number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set showmatch           " flashes matching paren when one is typed
set showmode            " show editing mode in status (-- INSERT --)
set hlsearch            " highlight searches
set incsearch           " do incremental searching
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should

" Show 'invisible' characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" ==== INDENTATION ====
set autoindent
set smartindent
set cindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

" ==== KEY REMAPPING ====
" map F2 to toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" map F3 to toggle wrap
nnoremap <F3> :set wrap! wrap?<CR>

" map ctrl+q,q to quit without save in command and insert mode
nnoremap  <C-q><C-q>    <ESC>:q!<CR>
inoremap  <C-q><C-q>    <ESC>:q!<CR>

" map ctrl+s to save current file and return to command mode
nnoremap  <C-s>         :w<CR>
vnoremap  <C-s>         <ESC>:w<CR>
inoremap  <C-s>         <ESC>:w<CR>

" map ctrl+s,s to save and exit in command mode
nnoremap  <C-s><C-s>    :wq<CR>

" map ctrl-c to esc, otherwise they are slightly different
inoremap  <C-c> <Esc>

" map ctrl+a/e to home/end
noremap  <C-a>          <Home>
noremap  <C-e>          <End>
inoremap <C-a>          <Home>
inoremap <C-e>          <End>

" map ctrl+j/k to go to next/prev split
noremap  <C-j>          <C-w>w
noremap  <C-k>          <C-w>W
inoremap <C-j>          <C-o><C-w>w
inoremap <C-k>          <C-o><C-w>W

" in visual mode, indentation keep the selection
vnoremap < <gv
vnoremap > >gv

" visual mode, move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" select previous next buffer
map <C-l> :bnext<CR>
map <C-h> :bprev<CR>

" handle ctrl+arrow, shift+arrow correctly in tmux"
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" leader configs
let mapleader = " "
" select all
map <Leader>sa ggVG"
" rip-grep (the current) word
nnoremap <leader>gw :Rg <C-R>=expand("<cword>")<CR><CR>
" ctrl-q is used in vsc, so use another way to enter visual block mode
nnoremap <leader>vb <C-v>

" ==== PLUGIN CONFIG ====
" configure easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgj'
let g:EasyMotion_smartcase = 1
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0
" alt+n/p, to easymotion down and up
map <M-n> <Plug>(easymotion-j)
map <M-p> <Plug>(easymotion-k)
imap <M-n> <C-o><Plug>(easymotion-j)
imap <M-p><C-o><Plug>(easymotion-k)
" alt+f, to bd-w, need to unmap f to make it work
nnoremap f <NOP>
map <M-f> <Plug>(easymotion-bd-w)
imap <M-f> <C-o><Plug>(easymotion-bd-w)
map <leader>f <Plug>(easymotion-bd-w)
imap <leader>f <Plug>(easymotion-bd-w)

" configure vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" configure fzf
" map ctrl-p to fzf
map <C-p> :FZF<CR>
imap <C-p> <C-o>:FZF<CR>

" settings for airline-vim, make it beautiful
let g:airline_theme='light'

" configure vim-ripgrep
let g:rg_command = 'rg --vimgrep -S'

" ==== OTHER SETTINGS ====
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
