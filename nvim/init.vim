" plug

call plug#begin("~/.rc/nvim/plugged")
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'mhinz/vim-startify'
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

"set scrolloff=6

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
"--
nnoremap tj :tabfirst <CR>
nnoremap tk :tablast  <CR>
"--
nnoremap td :tabclose <CR>
nnoremap tt :tabnew   <CR>


" Fix tmux navigation
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft <CR>
endif

" hidden chars
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" {{{ UNITE
nnoremap <C-o> :Unite file<CR>
nnoremap <C-b> :Unite buffer<CR>
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
nnoremap <C-f> :Unite grep:.<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])

let g:unite_source_history_yank_enable = 1
let g:neomru#file_mru_limit = 100

call unite#filters#converter_default#use(['converter_relative_word'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_length'])

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore ''.git'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_split_rule = "botright"
let g:default_context = {
    \ 'winheight' : 15,
    \ 'update_time' : 100,
    \ 'prompt' : '>>> ',
    \ 'enable_short_source_names' : 0,
    \ 'marked_icon' : '✓',
    \ 'ignorecase' : 1,
    \ 'smartcase' : 1,
    \ }

call unite#custom#profile('default', 'context', default_context)

" custom ignore pattern
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    \ 'ignore_pattern', join([
    \ '\.git/',
    \ 'tmp/',
    \ 'log/',
    \ 'public/assets/',
    \ 'node_modules/',
    \ 'bower_components/',
    \ ], '\|'))
" UNITE }}}

set nobackup
set nowb
set noswapfile

set mouse=

set textwidth=80
set colorcolumn=+1
:hi ColorColumn ctermbg=235

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['standard']
