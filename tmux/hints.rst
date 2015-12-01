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


Resource
--------

1. `A tmux Primer<https://danielmiessler.com/study/tmux/>` by Daniel Miessler.
2. Daniel's tmux config as `reference <https://raw.github.com/danielmiessler/tmux/master/.tmux.config>`.
