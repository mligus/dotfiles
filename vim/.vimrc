" Vundle {{{
" next 2 lines are required by Vaundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'badwolf'                    " nice theme
Plugin 'bling/vim-airline'          " powerline fork
Plugin 'ctrlpvim/ctrlp.vim'         " full path fuzzy finder
Plugin 'sjl/gundo.vim'              " visualize your Vim undo tree
Plugin 'majutsushi/tagbar'          " browse the tags of the current file
Plugin 'mhinz/vim-signify'          " indicate added, modified and removed lines based on VCS
Plugin 'scrooloose/nerdtree'        " explore your filesystem and to open files and directories
Plugin 'scrooloose/nerdcommenter'   " comment your code 'sexy'
Plugin 'fholgado/minibufexpl.vim'   " buffer tabbed manager

" All of your Plugins must be added before the following line
" next 2 lines are required by Vaundle
call vundle#end()
filetype plugin indent on
" }}}

" Common {{{
syntax enable                   " enable syntax highlighting
set backspace=indent,eol,start  " backspace over indent, end of 
                                " line and start of insertion
set clipboard=unnamed           " allow normal work with system buffer
set ttyfast                     " fast redraw
set number                      " show line numbers
set showcmd                     " show command in bottom bar (used with powerline)
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " show matching part of the pair for [] {} ()
filetype indent on              " load filetype-specific indent files
colorscheme badwolf
" }}}

" Searching {{{
set ignorecase                  " ignore case when searching
set incsearch                   " search as characters are entered
set hlsearch                    " highlight all matches
" }}}

" File & Encoding {{{
set encoding=utf-8              " encoding is utf-8
set fileencoding=utf-8
set fileformat=unix             " set unix line endings
set fileformats=unix,dos
" }}}

" Whitespaces & Indentation {{{
set tabstop=4                   " set tab to 4 spaces
set softtabstop=4               " number of spaces in tab when editing (insert & remove)
set autoindent                  " indent next line while writing code
set expandtab                   " expand tabs into spaces
set shiftwidth=4                " >> or << shifts lines by 4 spaces
" specific indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
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

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" }}}

" Bindings {{{
let mapleader=','
" map <ESC> to jk 
inoremap jk <esc>
" remove search results highlight
nnoremap <leader><space> :noh<CR>i
" toggle line numbers on/off
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
" space open/closes folds
nnoremap <space> za
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" toggle GUndo, Tagbar, NERDTree
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" previous/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" toggle display of whitespaces
nmap <leader>l :set list!<CR>
" }}}

" Folding {{{
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested fold max
set foldmethod=indent           " fold based on indent level
" }}}

" Airline plugin {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
" }}}

" MiniBuff plugin {{{
let g:miniBufExplStatusLineText=""
let g:miniBufExplCycleArround=1
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>
" }}}
" }}}

" Python {{{
let python_highlight_all = 1    " enable all Python syntax highlighting
" }}}
