" next 2 lines are required by Vaundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
" next 2 lines are required by Vaundle
call vundle#end()
filetype plugin indent on

" Common {{{
syntax enable                   " enable syntax highlighting
set backspace=indent,eol,start  " backspace over indent, end of 
                                " line and start of insertion
set clipboard=unnamed           " allow normal work with system buffer
set ttyfast                     " fast redraw
set number                      " show line numbers
set showcmd                     " show command in bottom bar
set wildmenu                    " visual autocomplete for command menu
set lazyredraw                  " redraw only when we need to
set showmatch                   " show matching part of the pair for [] {} ()
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
set ts=4                        " set tab to 4 spaces
set autoindent                  " indent next line while writing code
set expandtab                   " expand tabs into spaces
set shiftwidth=4                " >> or << shifts lines by 4 spaces
" specific indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
" }}}

" Bindings & Shortcuts {{{
" toggle line numbers on/off in normal and insert mode with F3
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
" }}}

" Python {{{
let python_highlight_all = 1    " enable all Python syntax highlighting
" }}}
