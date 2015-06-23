" Vundle {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle required! 
Plugin 'gmarik/vundle'

" The bundles you install will be listed here
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'https://github.com/altercation/vim-colors-solarized'
Bundle 'http://github.com/sjl/gundo.vim.git' 
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'wakatime/vim-wakatime'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Colors {{{
syntax enable           " enable syntax processing
set background=light
colorscheme solarized 
" }}}
" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start  " backspace is working over indent, end of line and start of insertion
set clipboard=unnamed           " allow normal work with system buffer
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4        
set modelines=1
filetype indent on      " set indentation per type of file
filetype plugin on      " load specific plugins per file type
set autoindent          " copy indent from current line when starting a new one
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu 
set lazyredraw          " redraw only when we need to.
set showmatch           " higlight matching parenthesis [{()}]
" }}}
" Searching {{{
set ignorecase                              " ignore case when searching
set incsearch                               " search as characters are entered
set hlsearch                                " highlight all matches
" }}}
" File & Encoding {{{
set encoding=utf-8        " encoding is utf-8
set fileencoding=utf-8
set fileformat=unix       " set unix line endings
set fileformats=unix,dos
" }}}
" Folding {{{
"=== folding ===
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za     " space open/closes folds 
set foldlevelstart=10   " start with fold level of 10
set foldmethod=indent   " fold based on indent level
" }}}
" Line Shortcuts {{{
" move lines up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
" }}}
" Navifation {{{
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

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>ev :vsp ~/.vimrc<CR>               " edit .vimrc 
nnoremap <leader>ez :vsp ~/.zshrc<CR>               " edit .zshrc
nnoremap <leader>sv :source ~/.vimrc<CR>            " load .vimrc bindings
nnoremap <leader><space> :noh<CR>                   " remove search results highlight
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
inoremap jk <esc>                                   " make jk an Esc, because Esc is too far ...
noremap <leader>q :bp<CR>                           " previous buffer
noremap <leader>w :bn<CR>                           " next buffer
nmap <leader>l :set list!<CR>                       " toggle display of whitespaces
" }}}
" Powerline {{{
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2          " last window will always have a status line (required for Powerline)
" }}}
" NERDTree {{{
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0                                               " don't change working directory
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" keymaps
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" }}}
" Backups {{{
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup
" }}}
" Tune-up {{{
set shell=zsh
" do not discard selection on indentation
vnoremap < <gv
vnoremap > >gv
" }}}
" Custom functions {{{
" }}}
" Python Mode {{{
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" }}}
" vim:foldmethod=marker:foldlevel=0
