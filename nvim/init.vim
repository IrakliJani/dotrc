" plug

call plug#begin("~/.rc/nvim/plugged")
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'
Plug 'scrooloose/nerdcommenter'
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script'
Plug 'editorconfig/editorconfig-vim'
Plug 'unblevable/quick-scope'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" -plug

" here starts THE mess...

filetype plugin indent on

let mapleader = "\<Space>"

syntax on
colorscheme Tomorrow\-Night

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set shortmess+=I
set tabstop=2 shiftwidth=2 expandtab autoindent smartindent

set cursorline
set lazyredraw

set nowrap

set splitbelow
set splitright

set autoread

" Keymap->VisualIndent
vnoremap > > gv
vnoremap < < gv

set number

" on number change
au WinEnter * :setlocal number cursorline
au WinLeave * :setlocal nonumber nocursorline

hi statusline ctermbg=green
set statusline=in\ %f\ %m\ %y
set statusline+=%=at\ %l:%c\ of\ %L

" Automatically resize vertical splits.
au WinEnter * :set winfixheight
au WinEnter * :wincmd =

" Set es6 to javascript
au BufRead,BufNewFile *.es6 setfiletype javascript

nmap <Leader>r :source ~/.rc/nvim/init.vim<cr>:echomsg "rc file reloaded"<cr>

nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+gP
vnoremap <Leader>p "+gP

" tabs
nnoremap th :tabprev  <CR>
nnoremap tl :tabnext  <CR>
nnoremap tj :tabfirst <CR>
nnoremap tk :tablast  <CR>
nnoremap td :tabclose <CR>
nnoremap tt :tabnew   <CR>


" Fix tmux navigation
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft <CR>
endif

" hidden chars
nmap <leader>; :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" clear
nmap <leader>l :nohlsearch<CR>

set nobackup
set nowb
set noswapfile

set mouse=

set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermbg=235

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

if executable('ag')
  set grepprg=ag\ --nogroup\ --hidden\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif
