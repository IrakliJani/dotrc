" {{{ Plug
call plug#begin("~/.rc/nvim/plugged")
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
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
Plug 'Mizuchi/vim-ranger'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'machakann/vim-sandwich'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tommcdo/vim-lion'
Plug 'editorconfig/editorconfig-vim'
Plug 'kchmck/vim-coffee-script'
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim'
"Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
"Plug 'samuelsimoes/vim-jsx-utils'
"Plug 'othree/html5.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'raichoo/haskell-vim'
Plug 'elmcast/elm-vim'
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'javascript', 'javascript.jsx'] }
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
call plug#end()
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
" {{{ General
let mapleader = "\<Space>"

"let g:onedark_terminal_italics=1
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Theme
syntax enable
colorscheme base16\-default
set background=dark

hi Normal guibg=none
hi VertSplit guibg=bg guifg=#333333
hi SignColumn guibg=#000000
set fillchars=vert:\│
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

" $, % and ^ are hard to press
map 4 $
map 5 %
map 6 ^

" Reload .vimrc
nmap <Leader>r :source ~/.rc/nvim/init.vim<cr>:echomsg "rc file reloaded"<CR>

" Invoke with '-'
nmap - <Plug>(choosewin)

" Ranger
nmap <C-o> :edit .<CR>

" Tab navigation
nnoremap th :tabprev  <CR>
nnoremap tl :tabnext  <CR>
nnoremap tj :tabfirst <CR>
nnoremap tk :tablast  <CR>
nnoremap td :tabclose <CR>
nnoremap tt :tabnew   <CR>

" wintabs in future
"map <leader>th  <Plug>(wintabs_previous)
"map <leader>tl  <Plug>(wintabs_next)
"map <leader>tc  <Plug>(wintabs_close)
"map <leader>to  <Plug>(wintabs_only)
"map <leader>twc <Plug>(wintabs_close_window)
"map <leader>two <Plug>(wintabs_only_window)
"command! Tabc WintabsCloseVimtab
"command! Tabo WintabsOnlyVimtab<Paste>

"Keep search matches in the middle of the screen
"nnoremap n nzz
"nnoremap N Nzz

" Hidden chars
nmap <leader>; :set list!<CR>

" Clear
nmap <leader>l :nohlsearch<CR>

" Toggle 80th line highlight
nmap <leader>g :exec &colorcolumn? "se colorcolumn=" : "se colorcolumn=80"<CR>

nmap <C-p> :FZF<CR>
nmap <C-f> :Ag<CR>
" Fix tmux navigation
" nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" }}}
" {{{ Plugin Configs
" Set Ag for FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Clever F ignore case
let g:clever_f_ignore_case = 1

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

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

" JSX functions
nnoremap <leader>ja :call JSXEncloseReturn()<CR>
nnoremap <leader>ji :call JSXEachAttributeInLine()<CR>
nnoremap <leader>je :call JSXExtractPartialPrompt()<CR>
nnoremap vat :call JSXSelectTag()<CR>
" }}}
" Functions {{{

fun! Light()
  colorscheme Tomorrow
endfunction

fun! Dark()
  colorscheme Tomorrow\-Night
endfunction

command! Light call Light()
command! Dark call Dark()

" }}}

" vim: set foldmethod=marker:
