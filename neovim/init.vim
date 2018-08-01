" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " dark powered neo-completion
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'w0rp/ale'  " ALE (Asynchronous Lint Engine) is a plugin for providing linting
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'fholgado/minibufexpl.vim'
Plug 'romainl/Apprentice'  " color schema
" Plug 'mhinz/vim-signify'  " replaced by 'airblade/vim-gitgutter' im my case
" Plug 'tpope/vim-surround'
" Plug 'neomake/neomake', { 'for': ['rust', 'haskell'] }

" FZF / Ctrlp for file navigation
if executable('fzf')
  " OSX vs Linux loading (depending on where fzf is)
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Darwin"
    Plug '/usr/local/opt/fzf'
  else
    Plug 'junegunn/fzf', {'dir': '~/.local/src/fzf', 'do': './install --all' }
  endif
  Plug 'junegunn/fzf.vim'
else
  Plug 'ctrlpvim/ctrlp.vim'
endif

" Language plugins
" Scala plugins
if executable('scalac')
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
endif
" Python plugins
Plug 'python-mode/python-mode', {'branch': 'develop'}
" Haskell Plugins
" if executable('ghc')
"   Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
"   Plug 'owickstrom/neovim-ghci', { 'for': 'haskell' }
" endif
" Rust Plugins
" if executable('rustc')
"  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"  Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" endif


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
set background=dark
" preview color schemas at http://vimcolors.com/
colorscheme apprentice
" }}}

" Python support {{{ 
let g:python_host_prog = '/Users/mligus/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/mligus/.pyenv/versions/neovim3/bin/python'
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
set tabstop=4                   " set tab to 4 spaces
set softtabstop=4               " number of spaces in tab when editing (insert & remove)
set shiftwidth=4                " >> or << shifts lines by 4 spaces
set expandtab                   " expand tabs into spaces
set shiftround                  " round indent to multiple of 'shiftwidth'
set autoindent                  " indent next line while writing code
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.jsonnet*      set filetype=c
au BufRead,BufNewFile *.libsonnet*    set filetype=c
au BufRead,BufNewFile todo*           set filetype=todo
au BufRead,BufNewFile *.txt           set filetype=todo
au BufRead,BufNewFile *.py            set filetype=python
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

" NERDCommenter plugin {{{
let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1  " Use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1  " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1  " Enable NERDCommenterToggle to check all selected lines is commented or not 
" }}}

" Deoplete plugin {{{
let g:deoplete#enable_at_startup = 1
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
let g:pymode_python = 'python3'
let g:pymode_rope = 1
set completeopt=menu        " disable doc preview on 'dot' completion for Rope
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = ['pyflakes', 'pylint', 'pep8', 'mccabe']
let g:pymode_lint_message = 1
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_trim_whitespaces = 1
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 120
" }}}


" Inspired by: https://github.com/seenaburns/dotfiles/blob/master/.config/nvim/init.vim
" vim:foldmethod=marker:foldlevel=0
