# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

if status is-interactive
    # Git abbreviations
    abbr -a gco git checkout
    abbr -a gp  git push

    # System abbreviations
    abbr -a update 'sudo pacman -Syu'
end
