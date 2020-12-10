" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/tagbar'        " install ctags: brew install ctags
Plug 'valloric/youcompleteme'  " https://github.com/ycm-core/YouCompleteMe
Plug 'ervandew/supertab'       " https://github.com/ervandew/supertab
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim
Plug 'mileszs/ack.vim'         " https://github.com/mileszs/ack.vim
Plug 'mhinz/vim-signify'       " https://github.com/mhinz/vim-signify
" Look for Vim color schemes here: https://vimcolorschemes.com/top
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
call plug#end()
" }}}

" Common {{{
syntax enable                   " enable syntax highlighting
set backspace=indent,eol,start  " backspace over indent, end of line and start of insertion
set clipboard=unnamed           " allow normal work with system buffer
set ttyfast                     " fast redraw
set number                      " show line numbers
set showcmd                     " show command in bottom bar (used with powerline)
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " show matching part of the pair for [] {} ()
set shell=zsh                   " use ZSH, Luke!
filetype indent on              " load filetype-specific indent files
let mapleader=','
set pastetoggle=<leader>v
if has('mouse')
  set mouse=a
endif
set t_Co=256
set relativenumber
" }}}

" Theme {{{
set background=dark
" colorscheme gruvbox
" let g:gruvbox_contrast_dark="hard"
colorscheme jellybeans
" }}}


" Python support {{{ 
let g:python_host_prog = $HOME."/.pyenv/versions/nvim2/bin/python"
let g:python3_host_prog = $HOME."/.pyenv/versions/nvim3/bin/python"
" }}}

" Searching {{{
set ignorecase                  " ignore case when searching
set hlsearch                    " highlight all matches
" }}}

" File & Encoding {{{
set encoding=utf-8              " encoding is utf-8
set fileencoding=utf-8
set fileformat=unix             " set unix line endings
set fileformats=unix,dos
" }}}

" Whitespaces, indentation & syntax highlighting {{{
filetype plugin on
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set shiftround
set autoindent
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo
au BufRead,BufNewFile *.py            set filetype=python
au BufRead,BufNewFile *.json          set filetype=json
" }}}

" Bindings {{{
" remove search results highlight
nnoremap <leader><space> :noh<CR>
" space open / closes folds
nnoremap <space> za
" move vertically by display line, not physical
nnoremap j gj
nnoremap k gk
" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
" toggle Tagbar
nnoremap <leader>tb :TagbarToggle<CR>
" previous/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" destroy buffer
map <C-x> :bd<CR>
" do not discard selection on indentation
vnoremap < <gv
vnoremap > >gv
" shortcut to save
nmap <leader>, :w<CR>
" show whitespaces
nmap <leader>l :set list!<CR>
" }}}

" Navigation {{{
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with arrow keys
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
" }}}

" Hard-mode {{{
" disable ex mode
noremap Q <ESC>
" disable arrow keys - as habbit breaker
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>
" }}}

" Folding {{{
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested fold max
set foldmethod=indent           " fold based on indent level
" }}}

" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" NERDCommenter config {{{
let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1  " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1  " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1  " Enable NERDCommenterToggle to check all selected lines is commented or not 
" }}}

" Airline config {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = '💣:'
let airline#extensions#ale#warning_symbol = '🚩:'
" }}}

" Bufferline config {{{
let g:bufferline_echo = 0
" }}}

" Python-mode config {{{
let g:pymode_options_max_line_length = 120
" let g:pymode_rope = 1
" }}}

" Deoplete config {{{
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#show_docstring = 1
" }}}

" Jedi-vim config {{{
autocmd FileType python setlocal completeopt-=preview  " don't show the docstring window to popup during completion
" }}}

" CtrlP config {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}

" Ack.vim config {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <c-f> :Ack!  %<Left><Left>
nnoremap <c-f>p :Ack! -S --python
" }}}

" Extras {{{
" }}}

