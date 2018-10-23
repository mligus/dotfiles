# Hints on Tmux


## Configuration

A user-specific configuration file should be located at ``~/.tmux.conf``, 
while a global configuration file should be located at ``/etc/tmux.conf``. 

Default configuration files can be found in ``/usr/share/tmux/``.


## Bindings

Prefix key is `Ctrl + a` (default ,`Ctrl + b`)


### Shortcuts

`?` - get help


### Sessions

`s`  - show sessions (or `$ tmux ls`)
`$` - rename current session
`d`  - detach from current session (or `$ tmux detach`)
`)` - next session
`(` - previous session
`L` - switch back to last session
`$ tmux new -s <session name>` - create new session
`$ tmux a -t <session name>` - attach to session (or `$ tmux a` for first session)
`$ tmux kill-session -t <session name>`


### Windows

`c` - create new window
`C` - create new window with prompt for name *
`,` - rename current window
`w` - list windows
`%` - split vertically
`"` - split horizontally
`n` - change to the next window
`p` - change to the previous window
`0 to 9` - select windows 0 through 9


### Panes

`%` - create a vertical pane
`"` - create a horizontal pane
`h` - move to the left pane *
`j` -  move to the pane below *
`l` -  move to the right pane *
`k` - move to the pane above *
`q` - show pane numbers (quickly click `0 to 9` to switch to respective pane)
`o` - toggle between panes
`}` - swap with next pane
`{` - swap with previous pane
`!` - break the pane out of the window
`x` - kill the current pane
`z` - maximize current pane
`<space>` - rearrange panes (switch between automatic layouts)


### Miscellaneous

`r` - reload `~/.tmux.conf` *
`t` - show time in current pane
`:` - to enter Tmux command


> (*) custom binding set in `~/.tmux.conf`


## Auxiliary software

```
brew install tmux-mem-cpu-load
```


## Advanced

The server holds *sessions* and the *windows* and *panes* within them.

### Example logical structure

  * Sessions are for an overall theme, such as work, or experimentation, or sysadmin.
  * Windows are for projects within that theme. So perhaps within your experimentation session you have a window titled noderestapi, and one titled lua sample.
  * Panes are for views within your current project. So within your sysadmin session, which has a logs window, you may have a few panes for access logs, error logs, and system logs.

### Multiple servers

`tmux -L moo` - connect to server under socket name “moo” and attach a new session. Create server if none already exists for socket.
`tmux -L moo` - attach will attempt to re-attach a session if one exists.


## Resources

  1. [A tmux Primer (2014)](https://danielmiessler.com/study/tmux/)
  2. [The Tao of tmux (online book)](https://leanpub.com/the-tao-of-tmux/read)
  3. [Everything you need to know about Tmux copy paste (2016)](http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting/)

