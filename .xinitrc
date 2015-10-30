if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#xrandr --auto

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr 	#cursor dursor
xset dpms 180           	#screen goes to sleep 3min

#xscreensaver -nosplash &  #  commented this out, as XMonad spawns xscreensaver now  
xbindkeys &
xmodmap ~/.Xmodmap &   #keymapping - geared toward thinkpad keyboard
start-pulseaudio-x11 &
sh ~/.fehbg &
redshift -l 43.253015:-89.153016 & 
#last is xmonad
exec xmonad
