" {{{ Plug
call plug#begin("~/.rc/nvim/plugged")
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'zefei/vim-wintabs'
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'simeji/winresizer'
Plug 't9md/vim-choosewin'
Plug 'terryma/vim-multiple-cursors'
"Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim' | Plug 'rbgrouleff/bclose.vim'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'machakann/vim-sandwich'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tommcdo/vim-lion'
Plug 'editorconfig/editorconfig-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'raichoo/haskell-vim'
Plug 'elmcast/elm-vim'
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'javascript', 'vim'] }
Plug 'pangloss/vim-javascript', { 'branch': 'develop' }
Plug 'irakli-janiashvili/vim-wombat-scheme'
call plug#end()
" }}}
" {{{ General
let mapleader = "\<Space>"

set termguicolors

" Theme
syntax enable
colorscheme janbat

" hi SignColumn guibg=#000000
" }}}
" {{{ Sets
set shortmess+=I
set tabstop=2 shiftwidth=2 expandtab autoindent smartindent
set cursorline
set nowrap
set splitbelow splitright

"set autoread
"set lazyredraw
set listchars=tab:▸\ ,eol:¬
set nobackup nowritebackup noswapfile
set ignorecase
"set mouse=
set number relativenumber
"set notimeout
"set ttimeout
"set ttimeoutlen=10
"set updatetime=1000
set nojoinspaces
set scrolloff=5
set clipboard=unnamed
" }}}
" {{{ Events
" }}}
" {{{ Mappings
" Re-select visual block after indenting + tab key will do the same
vnoremap > >gv
vnoremap < <gv

" Move visual block
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Make Y behave like other capitals
map Y y$

" Reload .vimrc
nmap <Leader>r :source ~/.rc/nvim/init.vim<CR>:echomsg "rc file reloaded"<CR>

" Invoke with '-'
nmap - <Plug>(choosewin)

" Tab navigation
nnoremap th :tabprev  <CR>
nnoremap tl :tabnext  <CR>
nnoremap tj :tabfirst <CR>
nnoremap tk :tablast  <CR>
nnoremap td :tabclose <CR>
nnoremap tt :tabnew   <CR>

" Wintabs mappings
nnoremap <S-l> :WintabsNext     <CR>
nnoremap <S-h> :WintabsPrevious <CR>
nnoremap <S-c> :WintabsClose    <CR>

" Search in the middle
nnoremap n nzz
nnoremap N Nzz

" Hidden chars
nmap <leader>; :set list!<CR>

" Clear
nmap <leader>l :nohlsearch<CR>

" Toggle 80th line highlight
nmap <leader>g :exec &colorcolumn? "se colorcolumn=" : "se colorcolumn=80"<CR>

" FZF and Ranger
nmap <C-p> :FZF<CR>
nmap <C-f> :Ag<CR>
nmap <C-o> :Ranger<CR>
" }}}
" {{{ Plugin Configs
" Set Ag for FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" enable jsx in js docs
let g:jsx_ext_required = 0

" Clever F ignore case
let g:clever_f_ignore_case = 1

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" WinResizer
let g:winresizer_vert_resize  = 1
let g:winresizer_horiz_resize = 1

" ChooseWin overlay
let g:choosewin_overlay_enable = 1

" Wintabs config
let g:wintabs_ui_sep_leftmost  = ' '
let g:wintabs_ui_sep_inbetween = '│'
let g:wintabs_ui_sep_rightmost = ' '
" }}}
" Functions {{{
" }}}

" vim: set foldmethod=marker:
