" Check if vim-plug installed {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" vim-plug setup {{{
call plug#begin('~/.vim/plugged')
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'
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

" Whitespaces & Indentation {{{
set tabstop=4                   " set tab to 4 spaces
set softtabstop=4               " number of spaces in tab when editing (insert & remove)
set autoindent                  " indent next line while writing code
set expandtab                   " expand tabs into spaces
set shiftwidth=4                " >> or << shifts lines by 4 spaces
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
" remove search results highlight
nnoremap <leader><space> :noh<CR>
" space open / closes folds
nnoremap <space> za
" move vertically by display line, not physical
" (useful for long wrapped lines)
nnoremap j gj
nnoremap k gk
" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
" previous/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" destroy buffer
map <C-x> :bd<CR>
" do not discard selection on indentation
vnoremap < <gv
vnoremap > >gv
" shortcut to save
nmap <leader>, :w<cr>
" show whitespaces
nmap <leader>l :set list!<cr>
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

" Python-Mode plugin {{{
let g:pymode_rope = 1
set completeopt=menu        " disable doc preview on 'dot' completion for Rope
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
" set max line length
let g:pymode_options_max_line_length = 120
" }}}

" setup folding for .vimrc
" vim:foldmethod=marker:foldlevel=0
