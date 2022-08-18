#           _         _  _
#    __  __(_) _ __  (_)| |_  _ __  ___
#    \ \/ /| || '_ \ | || __|| '__|/ __|
#  _  >  < | || | | || || |_ | |  | (__
# (_)/_/\_\|_||_| |_||_| \__||_|   \___|
#

# lower screen brightness
light -S 50

# hide mouse after period of no use
unclutter -idle 1 -root -jitter 2 &

# themes folder
export THEMES=~/.themes

# set xresources file
[ -f ~/.config/x/xresources ] && xrdb -merge -I$HOME ~/.config/x/xresources

# status bar scripts
~/.scripts/status/5sec &
~/.scripts/status/30sec &
~/.scripts/status/30min &
dwmbar

# desktop notifications
refdunst

# random background
refbg

# window compositor
#picom -CG --backend xrender --focus-exclude "x = 0 && y = 0 && override_redirect = true" &
picom -b

# music daemon
[ ! -s /usr/share/mpd/pid ] && mpd &
mpdnotifier &

# keyboard mapping
#[ -f ~/.config/x/xmodmap ] && xmodmap ~/.config/x/xmodmap

# sane trackpoint sensitivity
xinput set-prop "SynPS/2 Synaptics TouchPad" 286 2.5
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" -0.7

# hotkey daemon
sxhkd &

# nightlight daemon
redshift -c ~/.config/redshift/redshift.conf &

# allow X11 windows from any application I own
xhost si:localuser:$(whoami)

# execute window manager
exec dbus-launch --sh-syntax --exit-with-session dwm; exit

