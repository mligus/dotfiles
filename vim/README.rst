======================
Steps to configure Vim
======================

------------------------
Install and setup Vundle
------------------------

To get things working firstly install Vundle

.. code-block:: bash 

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Initial ``.vimrc`` can look like this one::

    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'

    " The bundles you install will be listed here

    filetype plugin indent on

    " The rest of your config follows here

Good reading:

1. http://dougblack.io/words/a-good-vimrc.html
2. http://gosukiwi.svbtle.com/vim-configuration-for-web-development
