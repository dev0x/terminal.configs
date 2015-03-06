if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr #cursor dursor
xset dpms 180           #screen sleep 3min
xautolock -detectsleep \
          -time     20 -locker   "xtrlock -b" &

xbindkeys &
xmodmap ~/.Xmodmap      #keymapping 
#syndaemon -t -k -i 1 &  #synaptics daemon not sure if its a good thing or bad thing
xflux -l 43.253015 -g -89.153016 > /dev/null
#last is xmonad
exec xmonad
