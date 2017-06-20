if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export _JAVA_AWT_WM_NONREPARENTING=1
export GIT_SSH=/usr/bin/ssh

xset -b
xset r rate 500 48

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xsetroot -cursor_name left_ptr  #cursor dursor
xset dpms 180                   #screen goes to sleep 3min

eval $(ssh-agent)

xbindkeys &
xmodmap ~/.Xmodmap &   #keymapping - geared toward thinkpad keyboard
#sh ~/trackpoint-speed.sh &
sh ~/.fehbg &
redshift -l 43.253015:-89.153016 & 
#last is xmonad
exec xmonad
