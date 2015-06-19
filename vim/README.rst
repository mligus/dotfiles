======================
Steps to configure Vim
======================

------------------------
Install and setup Vundle
------------------------

.. _vundle: https://github.com/gmarik/Vundle.vim 


.. code-block:: none

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Edit ``.vimrc`` to look like this::

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
