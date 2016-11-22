Steps to configure Vim
======================


Install and setup Vundle
------------------------

To get things working firstly install Vundle

.. code-block:: bash 

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Initial ``.vimrc`` can look like this one::

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

    " Your content {{{
    " }}}


Color Scheme (iTerm2 also)
--------------------------

Current theme is **Twilight**.
All themes are here: `Iterm2-color-schemes <http://iterm2colorschemes.com>`.

Font: **Inconsolata for Powerline** (patched to support Powerline plugin).
Size: **15 pt**


Plugins
-------

  * `Airline <https://github.com/bling/vim-airline>` - an Powerline for
  * `CtrlP <https://github.com/ctrlpvim/ctrlp.vim>` - full path fuzzy finder
  * `Gundo <https://github.com/sjl/gundo.vim>` - visualize your Vim undo tree
  * `Tagbar <https://github.com/majutsushi/tagbar>` - browse the tags of the current file
  * `Signify <https://github.com/mhinz/vim-signify>` - indicate added, modified and removed lines based on VCS
  * `NERDTree <https://github.com/scrooloose/nerdtree>` - explore your filesystem and to open files and directories
  * `NERDCommenter <https://github.com/scrooloose/nerdcommenter>` - comment your code **sexy**
  * `MiniBuf <https://github.com/fholgado/minibufexpl.vim>` -tabbed buffer manager
  * `The Silver Searcher <https://github.com/ggreer/the_silver_searcher>` - A code searching tool similar to ack, with a focus on speed.
  * `Python Mode <https://github.com/klen/python-mode>`
  * `Rust Vim <https://github.com/rust-lang/rust.vim>`
  * `Syntastic <https://github.com/vim-syntastic/syntastic>` is a syntax checking plugin for Vim created by Martin Grenfell.


Resource
--------

    1. `<http://dougblack.io/words/a-good-vimrc.html>`
    2. `<http://gosukiwi.svbtle.com/vim-configuration-for-web-development>`
    3. `<http://www.fullstackpython.com/vim.html>`
    4. `<https://justin.abrah.ms/vim/vim_and_python.html>`
