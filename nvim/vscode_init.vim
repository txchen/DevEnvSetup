" ==== INSTALL PLUGINS ====
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/vsc-plugged')

Plug 'junegunn/vim-plug'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
" forked version of easymotion that can work with vscode-neovim
Plug 'asvetliakov/vim-easymotion'

call plug#end()

set noswapfile          " we don't need swapfile
set nobackup            " real man does not need it

set updatetime=50       " improve user experience

set showcmd             " display incomplete commands

set laststatus=2        " always show status line
set ttimeoutlen=50      " make ESC key faster

set showmode            " show editing mode in status (-- INSERT --)
set hlsearch            " highlight searches
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

" ==== KEY REMAPPING ====
" map ctrl+a to select all text, I love windows
map <C-a> ggVG"

" in visual mode, indentation keep the selection
vnoremap < <gv
vnoremap > >gv

" visual mode, move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" (default) ctrl-v in iterm2 can paste from clipboard
" use uppercase Y to yank to system clipboard
vnoremap Y "+y

" use current word to find in files
nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

" leader configs
let mapleader = " "
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
imap <M-p> <C-o><Plug>(easymotion-k)
" alt+f, to bd-w, need to unmap f to make it work
nnoremap f <NOP>
map <M-f> <Plug>(easymotion-bd-w)
imap <M-f> <C-o><Plug>(easymotion-bd-w)

" configure vim-sneak
let g:sneak#use_ic_scs = 1

nmap <C-/> <Plug>VSCodeCommentaryLine
xmap <C-/> <Plug>VSCodeCommentary
vmap <M-y> "+y
