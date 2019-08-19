#!/bin/bash

case "$1" in
    s)
        /usr/bin/ssh-add ~/.ssh/id_rsa ;;
    d)
        /usr/bin/fix-screens desk
        /usr/bin/i3-msg move workspace to output primary
        /usr/bin/pkill nagstamon
        /usr/bin/nagstamon &>/dev/null &
        ;;
    k)
        setxkbmap us -variant altgr-intl
        ;;
    l)
        /usr/bin/fix-screens laptop ;;
    n)
        /usr/bin/nagstamon &>/dev/null & ;; 
    p)
        cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1 | tee >(xclip) ;;
    x)
        /bin/sleep 5s && /usr/bin/xdotool type "$(xclip -o)" ;;
    *)
        echo "no valid shortcut specified, exiting."
        cat << EOF
  s: add shah_meso ssh key
  d: fix-screens desk, start nagstamon
  k: set ANSI keyboard layout
  l: fix-screens laptop
  n: start nagstamon
  p: print randomly created string and pipe it to xclip
  x: sleep 5s and xdotool type zwischenablage
EOF
        ;;
        
esac
