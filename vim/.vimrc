" make vim not compatible with vi
set nocompatible
    
" do not detect filetype
filetype off

" Vundle part got here
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle "https://github.com/altercation/vim-colors-solarized"

filetype plugin indent on

" The rest of your config follows here

" enable syntax highlighting
syntax enable

" show line numbers
set number

" indent when moving to the next line while writing code
set autoindent

" when using the >> or << command, shift lines by 4 spaces
set shiftwidth=4

" Spaces, not tabs
" set ts=4
set tabstop=4
set shiftwidth=4
set expandtab

" show a visual line under ghe cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" automatically change window's cwd to file's dir
set autochdir

" enable all Python syntax highlighting features
let python_highlight_all = 1

" highlight excess line height
" set to 120, not 80 because today's displays are bigger :)
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Powerline setup
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2

" color scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif
" next line required if your terminal emulator's colorscheme not set to use the
" Solarized palette
" let g:solarized_termcolors=256
colorscheme solarized

" cuscom commands
map <F2> :NERDTreeToggle<CR>
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" Python-mode
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
