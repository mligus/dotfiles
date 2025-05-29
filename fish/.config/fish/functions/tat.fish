function tat
  set -l name (basename (pwd) | sed 's/\.//g')

  if tmux ls 2>&1 | grep -q "$name"
    tmux attach -t "$name"
  else if test -f .envrc
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  end
end
