#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

# graphical polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# compositor
run picom -b

# clipboard manager
copyq &

# set keyboard repeat rate
xset r rate 250 80 &

# Enable touchpad and natural scrolling
xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Natural Scrolling Enabled" 1 &
xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1 &

# autolocking desktop using betterlockscreen (from AUR)
xautolock -time 10 -locker "betterlockscreen -l blur" -detectsleep &
