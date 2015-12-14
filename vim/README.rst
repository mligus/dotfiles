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


Resource
--------

    1. `<http://dougblack.io/words/a-good-vimrc.html>`_
    2. `<http://gosukiwi.svbtle.com/vim-configuration-for-web-development>`_
