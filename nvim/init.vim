" plug

call plug#begin("~/.nvim/plugged")
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'elixir-lang/vim-elixir'
Plug 'isRuslan/vim-es6'
Plug 'kchmck/vim-coffee-script'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-obsession'
Plug 'unblevable/quick-scope'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'terryma/vim-multiple-cursors'
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

set scrolloff=6

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
nnoremap <C-f> :Ack

nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+gP
vnoremap <Leader>p "+gP

" tabs
nnoremap th :tabprev  <CR>
nnoremap tl :tabnext  <CR>
"--
nnoremap tj :tabfirst <CR>
nnoremap tk :tablast  <CR>
"--
nnoremap td :tabclose <CR>
nnoremap tt :tabnew   <CR>
"

" hidden chars
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

set nobackup
set nowb
set noswapfile

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[/](\.git|node_modules|bower_components|platforms|tmp)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

let g:ackprg = 'ag --vimgrep'

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

""" GOYO
function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set nonumber
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set number
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nmap <leader>g :Goyo<CR>
