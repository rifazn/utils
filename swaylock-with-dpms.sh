#!/bin/sh

# Adapted from https://code.krister.ee/lock-screen-in-sway/

seconds=7
color=111313

# Times the screen off and puts it to background
swayidle \
    timeout $seconds 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"'&

# Locks the screen immediately
swaylock -c $color
# Kills last background task so idle timer doesn't keep running
kill %%

