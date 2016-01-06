" Vundle {{{
" next 2 lines are required by Vaundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'badwolf'                        " nice theme
Plugin 'bling/vim-airline'              " powerline fork
Plugin 'ctrlpvim/ctrlp.vim'             " full path fuzzy finder
Plugin 'sjl/gundo.vim'                  " visualize your Vim undo tree
Plugin 'majutsushi/tagbar'              " browse the tags of the current file
Plugin 'mhinz/vim-signify'              " indicate added, modified and removed lines based on VCS
Plugin 'scrooloose/nerdtree'            " explore your filesystem and to open files and directories
Plugin 'scrooloose/nerdcommenter'       " comment your code 'sexy'
Plugin 'fholgado/minibufexpl.vim'       " buffer tabbed manager
Plugin 'ggreer/the_silver_searcher'     " fast code search tool like ack 
Plugin 'klen/python-mode'
Plugin 'rust-lang/rust.vim'             " Rust-lang support
Plugin 'wakatime/vim-wakatime'

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
set shell=zsh                   " use ZSH, Luke!
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

" navigate windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
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
" ... and '$' / '^' doesn't do anything
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
" do not discard selection on indentation
vnoremap < <gv
vnoremap > >gv
" save session - reopen it with `vim -S`
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
" destroy buffer
map <C-x> :bd<CR>
" }}}

" Folding {{{
set foldenable                  " enable folding
set foldlevelstart=10           " open most folds by default
set foldnestmax=10              " 10 nested fold max
set foldmethod=indent           " fold based on indent level
" }}}

" Vim file backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
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

" Signify plugin {{{
let g:signify_vcs_list = [ 'git', 'hg' ]
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" }}}

" CtrlP plugin {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" speed up CtrlP with Ag
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}

" NERDTree plugin {{{
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
" }}}

" Python-Mode plugin {{{
let g:pymode_rope = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Trim unused white spaces on save
let g:pymode_trim_whitespaces = 1
" Don't autofold code
let g:pymode_folding = 0
" }}}

" setup folding for .vimrc
" vim:foldmethod=marker:foldlevel=0
