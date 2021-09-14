
# Start slstatus toll from suckless.org
# slstatus &

#  Hide mouse pointer after 3 secs idle
unclutter -idle 3 &

# Load local X11 resources
# xrdb ~/.Xresources &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# modify key bindings
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Start dwm (from suckless.org as well) and forward output
# exec dwm > ~/.dwm.log

# Start i3
exec i3
