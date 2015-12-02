Hints on Bash
=============


Customize login prompt
----------------------

Bash configures its prompt by using the ``PS1`` and the ``PS2`` environmental variables:

  * ``PS1`` defines the primary prompt that you will see,
  * the ``PS2`` prompt is used for multi-line commands.

Example of ``PS1``::
    
    username@hostname: current_directory$

Usually, we define what these variables will hold in our ``~/.bashrc`` file, 
which is read when our interactive shell starts.




Resources
---------

  1. `How to Customize your Bash Prompt on a Linux VPS <https://www.digitalocean.com/community/tutorials/how-to-customize-your-bash-prompt-on-a-linux-vps>`.
  2. `Bash Shell PS1: 10 Examples to Make Your Linux Prompt like Angelina Jolie <http://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/>`.
