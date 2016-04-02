call plug#begin("~/.rc/nvim/plugged")
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'
Plug 'scrooloose/nerdcommenter'
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mkitt/tabline.vim'
Plug 'gabesoft/vim-ags'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'simeji/winresizer'
Plug 't9md/vim-choosewin'
Plug 'Shougo/deoplete.nvim'
Plug 'Raimondi/delimitMate' "Plug 'jiangmiao/auto-pairs'
Plug 'w0ng/vim-hybrid'
Plug 'Yggdroot/indentLine'
call plug#end()

" here starts THE mess...

let mapleader = "\<Space>"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set regexpengine=1
syntax on
"colorscheme Jellybeans
set background=dark
colorscheme hybrid

filetype plugin indent on

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set shortmess+=I
set tabstop=2 shiftwidth=2 expandtab autoindent smartindent

set cursorline

set nowrap

set splitbelow splitright

set autoread
set lazyredraw

" Re-select visual block after indenting + tab key will do the same
vnoremap <Tab>   > gv
vnoremap <S-Tab> < gv
vnoremap >       > gv
vnoremap <       < gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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

" ChooseWin

" invoke with '-'
nmap  -  <Plug>(choosewin)

" tabs
nnoremap th :tabprev  <CR>
nnoremap tl :tabnext  <CR>
nnoremap tj :tabfirst <CR>
nnoremap tk :tablast  <CR>
nnoremap td :tabclose <CR>
nnoremap tt :tabnew   <CR>

" Keep search matches in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

" Fix tmux navigation
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft <CR>
endif

" hidden chars
nmap <leader>; :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" clear
nmap <leader>l :nohlsearch<CR>

" VimFiler
nmap <leader>t :VimFilerExplorer<CR>

" indentation lines toggle
nmap <leader>i :IndentLinesToggle<CR><Esc>

" indent lines disabled by default
let g:indentLine_enabled = 0

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

" VimFiler
let g:vimfiler_as_default_explorer = 1

" Lightline
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ }

" WinResizer
let g:winresizer_vert_resize  = 1
let g:winresizer_horiz_resize = 1

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings() abort "{{{
  nnoremap <silent><buffer><expr> gt vimfiler#do_action('tabopen')
  nmap <buffer> <Tab> <Plug>(vimfiler_switch_to_other_window)
endfunction"}}}

let g:deoplete#enable_at_startup = 1
