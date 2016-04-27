if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset -b
xset r rate 500 48

xsetroot -cursor_name left_ptr #cursor dursor
xset dpms 180           #screen sleep 3min

#start ssh-agent with X so agent is accessible
eval $(ssh-agent)

sh ~/.fehbg &

start-pulseaudio-x11 & 
redshift -l 43.253015:-89.153016 & 

#last is xmonad
exec xmonad
