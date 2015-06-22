" --- VUNDLE START --

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle required! 
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
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'

" --- VUNDLE END ---


" --- COMMON CONFIGURATION START ---

set nocompatible          " make vim not compatible with vi
filetype on               " detect filetype and load plugins for them
filetype plugin on        " ... and load plugins for them
filetype indent on

let mapleader=","         " set leader to be a comma
set switchbuf=usetab
syntax enable             " enable syntax highlighting
set number                " show line numbers
set encoding=utf-8        " encoding is utf-8
set fileencoding=utf-8
set fileformat=unix       " set unix line endings
set fileformats=unix,dos
set autoindent            " indent when moving to new line
set shiftwidth=4          " shift lines by 4 spaces with >> and <<
set expandtab             " use 4 spaces, not tab
set tabstop=4
set shiftwidth=4
set cursorline            " show a visual line under the cursor's current line
set scrolloff=3           " keep the cursor visible within 3 lines when scrolling
set showmatch             " show the matching part of the pair for [] {} and ()
" set autochdir             " automatically change window's cwd to file's dir
set autoread              " reload files changed outside vim
set wildmenu              " visual autocomplete for command menu 
set lazyredraw            " redraw only when we need to.
set incsearch             " find the next match as we type the search
set hlsearch              " highlight searches by default
set bs=2                  " backspace over indent, eol, start
set clipboard=unnamed     " 
set shell=zsh

" Powerline setup
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2          " last window will always have a status line (required for Powerline)

set background=dark       " color scheme
colorscheme solarized     " set Solarized color scheme

" next line required if your terminal emulator's colorscheme not set to use the Solarized palette
" let g:solarized_termcolors=256

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" highlight excess line height
" set to 120, not 80 because today's displays are bigger :)
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGreyguibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" save as sudo
ca w!! w !sudo tee "%"

" Better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you
" re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" Create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" --- COMMON CONFIGURATION END ---


" --- PLUGINS CONFIGURATION START ---

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" --- PLUGINS CONFIGURATION END ---


" --- CUSTOM COMMANDS START ---

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" set map <leader>q and <leader>w to buffer prev/next buffer
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
map ,t :NERDTreeToggle<CR>

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" set tagbar hotkey
nmap <F8> :TagbarToggle<CR>
map <c-t> :TagbarToggle<CR>

" tab switch
nnoremap <F7> :sbnext<CR>
nnoremap <S-F7> :sbprevious<CR>

" do not discard selection on indentation
vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

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

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" move lines up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" --- CUSTOM COMMANDS END ---


" --- PYTHON-MODE START ---
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

" --- PYTHON-MODE END ---
