tmux hints
==========

Start tmux (on target machine)
------------------------------

$ tmux


Show sessions
-------------

$ <Ctrl-b> s
$ tmux ls


Create new session
------------------

$ tmux new -s <session-name>
$ tmux
(last will create session without name, not so convenient)


Attach to existing session
--------------------------

$ tmux a -t <session-name>
$ tmux a
(last will attach to first available session)


Detach from session
-------------------

$ tmux detach
$ <Ctrl-b> d


Kill session/windows/tmux in total
----------------------------------

$ tmux kill-session -t <session-name>
$ tmux kill-window -t <window-name>
$ killall tmux


Windows & Panes
---------------

``tmux session -> window(s) -> pane(s)``

  * **Sessions** are for an overall *theme*, such as *work*, or 
    *experimentation*, or *sysadmin*.
  * **Windows** are for *projects* within that theme. 
    So perhaps within your *experimentation* session you have 
    a window titled *noderestapi*, and one titled *lua sample*.
  * **Panes** are for *views* within your current *project*. 
    So within your *sysadmin* session, which has a *logs* window, 
    you may have a few panes for *access logs*, *error logs*, and *system logs*.

.. note::
    
    It’s also possible to create panes within a session without first creating a separate window.


Ctrl-B options
--------------
+ ``?`` - get help
    
Session management
++++++++++++++++++
  
  * ``s`` - list sessions
  * ``$`` - rename session 
  * ``d`` - detach from current session

Windows
+++++++

  * ``c`` - create new window 
  * ``,`` - rename current window 
  * ``w`` - list windows
  * ``%`` - split horizontally
  * ``"`` - split vertically 
  * ``n`` - change to the next window
  * ``p`` - change to the previous window
  * ``0 to 9`` - select windows from 0 to 9

Panes
+++++
  
  * ``%`` - create a horizontal pane
  * ``"`` - create a vertical pane
  * ``h`` - move to the left pane (custom, see ``.tmux.conf``)
  * ``j`` - move to the below pane (custom, see ``.tmux.conf``)
  * ``l`` - move to the right pane (custom, see ``.tmux.conf``)
  * ``k`` - move to the above pane (custom, see ``.tmux.conf``)
  * ``q`` - show pane numbers 
  * ``o`` - toggle between panes
  * ``}`` - swap with next pane
  * ``{`` - swap with previous pane
  * ``!`` - break the pane out of the window
  * ``x`` - kill the current pane

Misc
++++

  * ``t`` - show the time in current pane


Resource
--------

1. `A tmux Primer<https://danielmiessler.com/study/tmux/>` by Daniel Miessler.
2. Daniel's tmux config as `reference <https://raw.github.com/danielmiessler/tmux/master/.tmux.config>`.
