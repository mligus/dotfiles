" make vim not compatible with vi
set nocompatible
    
" detect filetype and load plugins for them
filetype on
filetype plugin on 
filetype indent on

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
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
Bundle "https://github.com/altercation/vim-colors-solarized"
Bundle 'wakatime/vim-wakatime'

" The rest of your config follows here

" enable syntax highlighting
syntax enable

" show line numbers
set number

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new buffers
set fileformats=unix,dos

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

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" show the matching part of the pair for [] {} and ()
set showmatch

" automatically change window's cwd to file's dir
set autochdir

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" reload files changed outside vim
set autoread   

" visual autocomplete for command menu
set wildmenu 

" redraw only when we need to.
set lazyredraw

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " highlight searches by default
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" set leader to be ...
let mapleader=","      

" jk is escape
inoremap jk <esc>

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

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

" --- CUSTOM COMMANDS ---

" set , as mapleader
"let mapleader = ","
 
" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" set NERDtree hotkey
map <F2> :NERDTreeToggle<CR>

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

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
